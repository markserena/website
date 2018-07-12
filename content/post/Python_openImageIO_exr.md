+++
title = "EXR [zips] compression"
date = "2014-03-14T19:44:32+05:30"
image = "img/blog/python/smart_reload_textures.jpg"
draft = false
showonlyimage = false
categories = [ "Python", "Maya"]
weight = 1
description = "Convert EXR to zips compression."
+++

Convert EXR to zips compression.
<!--more-->

Had this one sitting on my computer for a little while now. Just a little batch script to convert exr to zips compression instead of zip, it converts them from tiled to scanline which means nuke will read the sequence and preview changes faster.

To use simply right click on any file inside the folder of an image sequence you want converted.
**Choose SendTo > EXR / TGA**
It will convert your files into a subfolder labeled TGA/ZIP for you to copy over.

[Download --*openImageIO here*--](/downloads/exr_OpenImageIO.7z)  

Un-pack the 7z file and put it somewhere useful, then copy that path and put it into the PATH variable in your System Variables

[Download these --*batch scripts here*--](/downloads/exr_batchscripts.7z)  

Extract these to the desktop.  
In Windows Explorer type 'SendTo' in the address bar, and you'll get to the rightClick menu directory.  
Paste the batch scripts into this directory.

You should with any luck (haven't tested it in a while, so hopefully) you'll have something like this:

<img class="special-img-class" style="width:60%" src="/img/blog/python/exrZips.jpg" title="SendToShortcut"/>
