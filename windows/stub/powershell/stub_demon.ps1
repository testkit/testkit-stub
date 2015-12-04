function Check_Stub{
	if((Get-Process "testkit-stub" -ea SilentlyContinue) -eq $Null){
		return $false
	}else{
		return $true
	}
}

function Kill_Stub{
	if (Check_Stub){
		Stop-Process -processname "testkit-stub" -Force
             Start-Sleep -s 3
	}
	!(Check_Stub)
}

function Launch_Stub{
    if (!(Check_Stub)){
		Start-Process -File "c:\stub\testkit-stub.exe" -Verb  runAs 
	}
	Check_Stub
}

$resultes = @{
    "success" = { return '{"OK":1}' };
	"fail" = { return '{"Error":0}' }
}

$url = "http://127.0.0.1:9090/"
Write-Host "Listening at $url..."
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($url)
$listener.Start()



while ($listener.IsListening)
{
    $context = $listener.GetContext()
    $requestUrl = $context.Request.Url
    $response = $context.Response

    Write-Host ''
    Write-Host "> $requestUrl"

    $localPath = $requestUrl.LocalPath
	$route_path = $requestUrl.LocalPath
	Write-Host "Route: "$route_path

    if ($route_path -eq $null)    {
        $response.StatusCode = 404
    }
	elseif ($route_path -eq "/stop_demon"){
	    $content = & ($resultes.Get_Item("success"))
        $buffer = [System.Text.Encoding]::UTF8.GetBytes($content)
        $response.ContentLength64 = $buffer.Length
        $response.OutputStream.Write($buffer, 0, $buffer.Length)
		$response.Close()
		$responseStatus = $response.StatusCode
		$listener.Stop()
		exit 1
	}
    elseif ($route_path -eq "/launch_stub"){
		$result = Launch_Stub
		if($result){
			$content = & ($resultes.Get_Item("success"))
		}else{
			$content = & ($resultes.Get_Item("fail"))
		}
        $buffer = [System.Text.Encoding]::UTF8.GetBytes($content)
        $response.ContentLength64 = $buffer.Length
        $response.OutputStream.Write($buffer, 0, $buffer.Length)
    }
	elseif ($route_path -eq "/kill_stub"){
		$result = Kill_Stub
		if($result){
			$content = & ($resultes.Get_Item("success"))
		}else{
			$content = & ($resultes.Get_Item("fail"))
		}
        $buffer = [System.Text.Encoding]::UTF8.GetBytes($content)
        $response.ContentLength64 = $buffer.Length
        $response.OutputStream.Write($buffer, 0, $buffer.Length)
    }
	elseif ($route_path -eq "/check_stub"){
		$result = Check_Stub
		if($result){
			$content = & ($resultes.Get_Item("success"))
		}else{
			$content = & ($resultes.Get_Item("fail"))
		}
        $buffer = [System.Text.Encoding]::UTF8.GetBytes($content)
        $response.ContentLength64 = $buffer.Length
        $response.OutputStream.Write($buffer, 0, $buffer.Length)
    }
	else {
		$response.StatusCode = 404
	}
    
    $response.Close()

    $responseStatus = $response.StatusCode
    Write-Host "< $responseStatus"
}