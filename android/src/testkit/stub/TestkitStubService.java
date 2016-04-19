package testkit.stub;

import android.app.Notification;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Build;
import android.os.IBinder;
import android.support.v4.app.NotificationCompat;
import android.util.Log;

import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class TestkitStubService extends Service {
    private static final String LOG_TAG = "TestkitStubService";

    private Process binary_process = null;

    public TestkitStubService() {
    }

    private void stopStubServer(){
        this.binary_process.destroy();
        try {
            this.binary_process.waitFor();
        }catch(InterruptedException e){
            e.printStackTrace();
        }
        this.binary_process = null;
        android.os.Process.killProcess(android.os.Process.myPid());
    }

    private void startStubServer(){
        String stub = "testkit-stub";
        String path = getFilesDir().getPath() + "/";
        try {// if can't open, then create it
            FileInputStream fis = openFileInput(stub);
            try {fis.close();} catch (IOException e) {}
        } catch (FileNotFoundException e1) {
            try {
                InputStream input = getAssets().open("bins/" + Build.CPU_ABI + "/" + stub); // create stub according to ABI
                FileOutputStream fo = openFileOutput(stub, 0);
                int length = input.available();
                byte [] buffer = new byte[length];// how to delete buffer?
                input.read(buffer);
                input.close();
                fo.write(buffer);
                fo.flush();
                fo.close();
                //getAssets().close(); // this will cause fc if launch again
                Runtime.getRuntime().exec("chmod 744 " + path + stub);
            } catch (IOException e) {
                Log.e(LOG_TAG, "Exception is thrown!");
                Log.e(LOG_TAG, e.getMessage());
                e.printStackTrace();
            }
        }

        try {
            binary_process = Runtime.getRuntime().exec("sh -c " + path + stub);
            String line = "", res = "";

            InputStream input = binary_process.getInputStream();
            DataInputStream osRes = new DataInputStream(input);
            while((line = osRes.readLine()) != null) res += line + "\n";
            osRes.close();
            input.close();

            input = binary_process.getErrorStream();
            osRes = new DataInputStream(input);
            while((line = osRes.readLine()) != null) res += line + "\n";
            osRes.close();
            input.close();
            Log.i(LOG_TAG, res);
        } catch (IOException e) {
            Log.e(LOG_TAG, "Exception is thrown!");
            Log.e(LOG_TAG, e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    public void onCreate() {
        super.onCreate();

    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (intent.getAction().equals(Constants.ACTION.STARTFOREGROUND_ACTION)) {
            Log.i(LOG_TAG, "Received Start TestkitStubService Intent ");
            if(null == this.binary_process) {
                startStubServer();
            }
            Intent notificationIntent = new Intent(this, TestkitStub.class);
            notificationIntent.setAction(Constants.ACTION.MAIN_ACTION);
            notificationIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK
                    | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            PendingIntent pendingIntent = PendingIntent.getActivity(this, 0,
                    notificationIntent, 0);

            /*
            Intent previousIntent = new Intent(this, TestkitStubService.class);
            previousIntent.setAction(Constants.ACTION.PREV_ACTION);
            PendingIntent ppreviousIntent = PendingIntent.getService(this, 0,
                    previousIntent, 0);

            Intent playIntent = new Intent(this, TestkitStubService.class);
            playIntent.setAction(Constants.ACTION.PLAY_ACTION);
            PendingIntent pplayIntent = PendingIntent.getService(this, 0,
                    playIntent, 0);

            Intent nextIntent = new Intent(this, TestkitStubService.class);
            nextIntent.setAction(Constants.ACTION.NEXT_ACTION);
            PendingIntent pnextIntent = PendingIntent.getService(this, 0,
                    nextIntent, 0);
            */

            Bitmap icon = BitmapFactory.decodeResource(getResources(),
                    R.drawable.ic_launcher);

            Notification notification = new NotificationCompat.Builder(this)
                    .setContentTitle("Testkit-Stub Service is running")
                    .setTicker("Testkit-Stub Service")
                    .setSmallIcon(R.drawable.ic_launcher)
                    .setLargeIcon(
                            Bitmap.createScaledBitmap(icon, 128, 128, false))
                    .setContentIntent(pendingIntent)
                    .setOngoing(true)
                    /*.addAction(android.R.drawable.ic_media_previous,
                            "Previous", ppreviousIntent)
                    .addAction(android.R.drawable.ic_media_play, "Play",
                            pplayIntent)
                    .addAction(android.R.drawable.ic_media_next, "Next",
                            pnextIntent)*/
                    .build();
            startForeground(Constants.NOTIFICATION_ID.FOREGROUND_SERVICE,
                    notification);
        /*} else if (intent.getAction().equals(Constants.ACTION.PREV_ACTION)) {
            Log.i(LOG_TAG, "Clicked Previous");
        } else if (intent.getAction().equals(Constants.ACTION.PLAY_ACTION)) {
            Log.i(LOG_TAG, "Clicked Play");
        } else if (intent.getAction().equals(Constants.ACTION.NEXT_ACTION)) {
            Log.i(LOG_TAG, "Clicked Next");
        */
        } else if (intent.getAction().equals(
                Constants.ACTION.STOPFOREGROUND_ACTION)) {
            Log.i(LOG_TAG, "Received Stop Foreground Intent");
            stopForeground(true);
            stopSelf();
        }
        return START_STICKY;
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        Log.i(LOG_TAG, "In onDestroy");
        if(null != binary_process){
            this.stopStubServer();
        }
    }

    @Override
    public IBinder onBind(Intent intent) {
        // Used only in case of bound services.
        return null;
    }
}
