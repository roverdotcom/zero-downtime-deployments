#!/bin/bash
export UWSGI_MASTER=1
export UWSGI_PROCESSES=8
export UWSGI_ENABLE_THREADS=1
export UWSGI_ZERGPOOL=/var/run/zergpool:127.0.0.1:9000
export UWSGI_PIDFILE=/var/run/zergpool.pid
uwsgi 
