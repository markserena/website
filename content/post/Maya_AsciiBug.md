+++
title = "Saving plugin data in the ascii file header"
date = "2013-10-14T19:44:32+05:30"
image = "img/blog/maya/maya_ascii_header.jpg"
draft = false
showonlyimage = false
categories = [ "Python", "Maya"]
tag = [ "Python", "Maya"]
weight = 1
description = "Reload modified Maya textures within timeframe."
+++

Maya bug not saving requies statement in the ascii header 
<!--more-->


This is essential for our RenderManager to know what to render with!  
There is a bug in Maya where plugin info does not get saved if you have Save Panel Layout with File disabled.  
Enable Preferences>Interface>UI Elements>Save Panel Layouts With File.  

It should read like this in your ASCII
```
_//Maya ASCII 2011 scene_  
_//Name: example.ma_  
_//Last modified: Tue, Jun 21, 2011 10:51:57 AM_  
_//Codeset: 1252_  
_requires maya “2011”;_  
_requires “Mayatomr” “2011.0m - 3.8.1.26 “;_  
_requires “stereoCamera” “10.0”;_  
_currentUnit -l centimeter -a degree -t pal;_  
_fileInfo "application" "maya";_  
_fileInfo "product" "Maya 2011";_  
_fileInfo "version" "2011 x64";_  
```