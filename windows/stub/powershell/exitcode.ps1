$exit_code = 0
"Args:" + $args[0]
if($args[0] -ne "1"){
	$exit_code = 1
}
"exit_code:" + $exit_code
exit $exit_code