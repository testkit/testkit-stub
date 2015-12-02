#$suitefile =opt/tct-backgrounds-css3-tests/tct-backgrounds-css3-tests.msi
function DowloadSuite($suitefile, $suite, $hostip){
	$source = "http://" + $hostip + ":8080/packages/" + $suitefile
	$destination = "c:\stub\packages\"+ $suite + ".msi"

	#Write-Host $source
	Invoke-WebRequest $source -OutFile $destination
	return $?
}

function RemoveOutOfDates($suite, $parent_folder){
	$source = $parent_folder + "\" + $suite
	if (Test-Path $source){
		"Removing out-of-date suites"
		Remove-Item -Recurse -Force $source
	}
}

function UnzipSuite($suite){
	$zip_file = "c:\stub\packages\"+ $suite + ".zip"
	RemoveOutOfDates $suite "c:\stub\packages\opt"
	$shell = new-object -com shell.application
	$zip = $shell.NameSpace($zip_file)
	foreach($item in $zip.items()){
		$shell.NameSpace("c:\stub\packages").copyhere($item)
	}
}

$exit_code = 0
if (DowloadSuite $args[1] $args[0] $args[2]){
    "Download suite zip successfully"
	#unzip suite
	#UnzipSuite($args[0])
	#execute msi install quietly
	$params = "/i c:\stub\packages\"+ $args[0] + ".msi /qn /quiet" 
	Start-Process -File "C:\Windows\System32\msiexec" -ArgumentList $params -Verb  runAs
	
	if($?){
		"Successfully install"
		$exit_code = 1
		exit $exit_code
	}else{
		"Fail to install"
		$exit_code = -1
		exit $exit_code
	}
}else{
    "Fail to download suite '" + $args[0] + ".zip"
	$exit_code = -2
	exit $exit_code
}

