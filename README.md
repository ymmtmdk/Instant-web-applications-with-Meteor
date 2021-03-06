Background
----------

Meteor simplifies the development of single page, real-time, streaming data update applications by moving the entire 
client and server stack to JavaScript.  Meteor offers an elegant consistent high level "reactive" programming 
model throughout the stack. 

See how you can build a web accessible, real-time updated, security access controlled sales chart web application in minutes.

Please see [Instant web applications with Meteor](http://www.ibm.com/developerworks/opensource/library/wa-meteor-webapps/index.html)  for detailed information on working with this code.

![Real time udpated sales chart with full user access control](http://www.ibm.com/developerworks/opensource/library/wa-meteor-webapps/figure3.jpg)

[**Try this app now on IBM's Codename BlueMix**](http://meteorsales1.ng.bluemix.net)

Open up multiple browser windows running the app; update sales in one of the windows, and observe the pie charts update across all.

[**Try an access controlled version of the app now on IBM's Codename BlueMix**](http://meteorsales2.ng.bluemix.net)

Mobile Photo Sharing Example on Meteor
--------------------------------------

Take Meteor mobile.  Build a photo sharing app for your mobile phone using Meteor.

![dW Foto Share - a mobile photo sharing service](http://www.ibm.com/developerworks/opensource/library/wa-meteor-webapps/figure7.jpg)

[**Try this mobile web app now on your phone - hosted on IBM's Codename BlueMix**](http://meteorfotoshare.ng.bluemix.net)

Please see [Instant web applications with Meteor](http://www.ibm.com/developerworks/opensource/library/wa-meteor-webapps/index.html)  for detailed information on working with this code.

While the original code worked well with Meteor 0.6.3.1; the Meteor platform itself is undergoing some rapid changes as it heads towards release 1.0. Some changes broke compatibility with 0.6.3.1.

This repository contains code that will be updated periodically to work with the most current version of Meteor.

### NEW UPDATE

The code is now compatible with Meteor 0.8.0.0 (New Blaze Engine).  Download [the zip file here](https://bitbucket.org/singli/instant-web-applications-with-meteor/downloads/code4meteor0_8_0_0.zip). 

### NEW UPDATE for BlueMix users

Please note that:

* BlueMix is currently in beta and under active development
* Meteor is currently changing rapidly as it heads towards 1.0 release

The following notes on BlueMix deployment are based on BlueMix beta week-number-1 + Meteor Preview 0.7.1.2 and may become out of date quickly.

* After you run meteor bundle on an app, it becomes a node application that can be deployed (anywhere, including BlueMix)
* Remove the fiber implementation in the bundle, it is native to your platform, follow the README in the Meteor bundle you created
* Make sure you use the Golang version of the cf client for BlueMix, version 6.0+, not the older Ruby one
* Use the Heroku Node.js build-pack
* Create a package.json file for npm
* Create a MongoD service instance in BlueMix for each of your apps
* Locate the URL from the MongoD service instance, and set MONGO_URL environment variable on BlueMix;  use 'cf set-env'
* Set the ROOT_URL environment variable on BlueMix; use 'cf set-env'

For the near future, I am developing a [BlueMix Meteor build-pack](https://github.com/Sing-Li/heroku-buildpack-nodejs) with aim to ease Meteor BlueMix deployment.

### NEW UPDATE for Docker 0.8+ users

If you are already using Docker and want the fastest path to samples nirvana, you can have all three applications running in under
a minute within a single LXC on a host/VPS (with 1GB RAM or more - otherwise you may run of of memory) using just these two commands:



    docker pull singli/instantmeteor
    docker run -p=3000:3000 -p=3010:3010 -p=3020:3020 -t -i singli/instantmeteor

Then access the three applications over the Web using port 3000, 3010, and 3020 respectively.



### Original Readme.txt

To try out this sample code, you need to first make sure that
Meteor is installed and running on your system.

This sample code has been tested against Meteor 0.6.3.1.

Please note that Meteor 0.6.3.1 officially supports only MacOSX and Linux.

See official Meteor website for support of Windows.

Once you are sure that Meteor is running fine, perform the following:

1. create a new directory for the code
2. copy the content of the download to the new directory
3. chmod +x instcode.sh
    (you may wish to perform the steps inside the instcode.sh script manually)
4. ./instcode.sh

### Included instcode.sh

The instcode.sh script performs the following:

1.	use meteor to create three new projects
2.	remove the default contents of the projects
3.	add and remove the security and login packages required for each project
4.	replace the contents of the projects with the downloaded code

#### NOTE

When you run the sales and fotoshare projects for the very first time, 
Meteor may immediately reboot with an exception thrown.  The bootstrap code
will create the two users - sing and joe - the first time it is executed.



