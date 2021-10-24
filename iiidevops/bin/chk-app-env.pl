#!/usr/bin/perl
use Carp;

$branch = defined($ARGV[0])?lc($ARGV[0]):'master';
$options = defined($ARGV[1])?lc($ARGV[1]):'none';
$env_file = 'iiidevops/app.env';
$branch_env_file = "$env_file.$branch";
if (-e $branch_env_file) {
	print("Useing env_file : [$branch_env_file]..\n");

	# replace branch_env_file to env_file
	$tmpl = '';
	open(FH, '<', $branch_env_file) or croak "error opening $branch_env_file: stopped";
	while(<FH>){
		$tmpl .= $_;
	}
	close(FH);
	
	open(FH, '>', $env_file) or croak "error opening $env_file: stopped";
	print FH $tmpl;
	close(FH);	
}
else {
	print("Useing env_file : [$env_file]..\n");
}

if ($options eq 'print') {
	$cmd_msg = `cat $env_file`;
	print("\n-----\n$cmd_msg\n-----\n");
}