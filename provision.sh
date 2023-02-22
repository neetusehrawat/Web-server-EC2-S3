#!/bin/bash
VERSION=1.01
ACTION=${1}

function install_start(){
sudo yum update -y
sudo amazon-linux-extras install nginx1.12 -y
sudo chkconfig nginx on
sudo aws s3 cp s3://neetukumari-assignment-webserver/index.html /usr/share/nginx/html/index.html
sudo service nginx start 
}

function uninstall_stop(){
sudo service stop nginx
sudo rm /usr/share/nginx/html/*
sudo yum remove nginx -y

}

function show_version(){
echo $VERSION
}

function display_help(){
cat << EOF
Usage: ${0} {-r|--remove|-v|--version|-h|--help}
OPTIONS:
	-r | --remove Stop nginx, delete files and uninstall nginx
	-v | --version Show file version
	-h | --help Display the command help
EOF
}

case "$ACTION" in
	-h|--help)
		display_help
		;;
	-r|--remove)
		uninstall_stop
		;;
	-v|--version)
		show_version
		;;
	*)
	install_start
	exit 1
esac
