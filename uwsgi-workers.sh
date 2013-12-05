#!/bin/bash

POOL=$1

export UWSGI_HOME='/home/vagrant/env'
export UWSGI_CHDIR='/vagrant/demo_project'
export UWSGI_WSGI_FILE='demo_project/wsgi.py'
export UWSGI_PROCESSES='3'
export UWSGI_THREADS='2'
export UWSGI_ENV='DJANGO_SETTINGS_MODULE=demo_project.settings'
export UWSGI_LOGTO='/var/log/uwsgi/%n.log'
export UWSGI_HARAKIRI='20'
export UWSGI_VACUUM='True'
export 
export UWSGI_MASTER=1
export UWSGI_PROCESSES=4
export UWSGI_THREADS=4
export UWSGI_SINGLE_INTERPRETER=1
export UWSGI_ENABLE_THREADS=1
export UWSGI_BUFFER_SIZE=32768
export UWSGI_ZERG=/var/run/zergpool
export UWSGI_PIDFILE=/var/run/uwsgi.$POOL.pid

uwsgi 
