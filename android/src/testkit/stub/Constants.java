package testkit.stub;

public class Constants {
    public interface ACTION {
        public static String MAIN_ACTION = "com.intel.testkit.action.main";
        public static String PREV_ACTION = "com.intel.testkit.action.prev";
        public static String PLAY_ACTION = "com.intel.testkit.action.play";
        public static String NEXT_ACTION = "com.intel.testkit.action.next";
        public static String STARTFOREGROUND_ACTION = "com.intel.testkit.action.startforeground";
        public static String STOPFOREGROUND_ACTION = "com.intel.testkit.action.stopforeground";
    }

    public interface NOTIFICATION_ID {
        public static int FOREGROUND_SERVICE = 101;
    }
}
