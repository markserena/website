+++
title = "Smart Reload Textures"
date = "2013-10-07T19:44:32+05:30"
image = "img/blog/python/py_smart_reload_textures.jpg"
draft = false
showonlyimage = false
categories = [ "Maya"]
tags = [ "Python", "Maya"]
weight = 1
description = "Reload modified Maya textures within timeframe."
+++

Reload textures that have been modified within a specified amount of time.
<!--more-->

This script will search all your files (maya/mentalray) for textures that have been modified in a specified amount of time.
Instead of reloading all textures like other refresh scripts it will only refresh what has been modified. 

Copy it to your scripts folder, or copy and paste it into your script editor.  
To execute the script run the following in a **PYTHON** tab:

{{< highlight python >}}
import smartReloadTextures;  
reload(smartReloadTextures);
refreshTime = 30
smartReloadTextures.reloadTextures(refreshTime);
{{< /highlight >}}

<!-- {{< gist gist_sha1_hash >}}  -->
<!-- <script src="https://gist.github.com/markserena/6984202.js"></script> -->


**smartReloadTextures.reloadTextures(time)** = time in minutes you wish to threshold the check.
Haven't tested it on MAC or Linux, I assume it will work. Try it let me know.