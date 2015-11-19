function RemoveOutOfDates($suite, $parent_folder){
	$source = $parent_folder + "\" + $suite
	if (Test-Path $source){
		"Removing out-of-date suites"
		Remove-Item -Recurse -Force $source
	}
}

$exit_code = 1

#execute msi uninstall quietly
$params = "/x c:\stub\packages\"+ $args[0] + ".msi /qn /quiet" 
Start-Process -File "C:\Windows\System32\msiexec" -ArgumentList $params -Verb  runAs
	
if($?){
	"Successfully uninstall"
	RemoveOutOfDates $args[0] "C:\Program Files"
}else{
	"Fail to uninstall"
	$exit_code = 0
}

exit $exit_code