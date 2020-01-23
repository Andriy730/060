#!/usr/bin/env bash

yum update httpd
yum install -y httpd
systemctl enable httpd
systemctl start httpd
