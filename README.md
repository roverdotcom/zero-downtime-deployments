# Zero Downtime Deployments

This is an exmaple project to show how zero downtime deployments can be done using Django, uWSGI, and nginx using the uWSGI Zerg pool functionality.

This is based off https://github.com/wunki/django-salted. For more information, please check that project's readme.

To use:

1. Setup the vm
  1. Install all the requirements for django-salted as listed here: https://github.com/wunki/django-salted
  1. clone this repo to your local box
  1. Issue a `vagrant up`, wait a while
  2. run `curl localhost:8080` to see if everything is working as it should. It should return "This is version 1!"
1. Start the load test
  1. ssh into the box with `vagrant ssh`
  2. cd to `/vagrant`
  3. run 'curl localhost' to see if everything is working. It should return 'This is version 1!'
  4. run `/vagrant/load-test.sh`
1. Deploy Version 2
  4. open a second ssh session in another terminal tab via `vagrant ssh`
  5. run `cd /vagrant && sudo ./deploy.sh v2`
  6. Watch it deploy, you can watch the load test tab to see that all the requests are happily processed.
  7. When deployment is done, do a `curl localhost` to confirm that you are now running Version 2.
