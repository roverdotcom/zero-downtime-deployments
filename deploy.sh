#!/bin/bash

VERSION=$1
APP_ROOT=/vagrant/demo_project

if [ ! -e $APP_ROOT/$VERSION ] ; then
  echo "This release doesn't exist."
  exit 1
fi

# below requires current symlink to already exist.
if [ ! -e $APP_ROOT/current ]; then
  echo "This is an initial release. Creating 'current' symlink."
  ln -vnsf $APP_ROOT/$VERSION $APP_ROOT/current
fi

ln -vnsf $APP_ROOT/$VERSION $APP_ROOT/next 
ln -vnsf $(readlink $APP_ROOT/current) $APP_ROOT/last 
mv -vTf $APP_ROOT/next $APP_ROOT/current 

echo "Restarting UWSGI"

echo "Restarting rover-web alpha pool."
uwsgi --pause /var/run/uwsgi.alpha.pid
sleep 5
sudo service uwsgi-worker stop POOL=alpha
sudo service uwsgi-worker start POOL=alpha

echo "Sleeping 30."
sleep 30

echo "Restarting rover-web beta pool."
uwsgi --pause /var/run/uwsgi.beta.pid
sleep 5
sudo service uwsgi-worker stop POOL=beta
sudo service uwsgi-worker start POOL=beta
