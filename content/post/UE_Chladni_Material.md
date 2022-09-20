+++
title = "Chladni Pattern"
date = "2022-09-15T00:08:00+09:30"
image = "img/blog/UE/Chladni/UE_Chladni_Pattern.jpg"
draft = false
showonlyimage = false
categories = ["Unreal"]
tags = ["Chladni", "Cymatic", "Shader", "UVs", "UE5", "UE4", "Unreal"]
weight = 1
description = "Recreating the Chladni/Cymatic Resonance pattern in a shader"
+++

Recreating The Chladni Pattern
<!--more-->

Watchning a Houdini Video by Junichiro Horikawa [**HERE**](https://www.youtube.com/watch?v=wEXaBtZFgWE) that builds the Chladni (Cymatic) resonance effect in 3D and thought it a good exercise to recreate in an Unreal Material. 
## Version 1.0
----
<span style="color:darkgrey;"><sub>*More correct version below*</sub></span>



Watchning a Houdini Video by Junichiro Horikawa [**HERE**](https://www.youtube.com/watch?v=wEXaBtZFgWE) that builds the Chladni (Cymatic) resonance effect in 3D and thought it a good exercise to recreate in an Unreal Material. 

Following the algorithm from [Paul Bourke](http://paulbourke.net/geometry/chladni/)

```math
cos(n.PI.x./L) cos(m pi y / L) - cos(m pi x / L) cos(n pi y / L) = 0 
```

It is stated on Paul’s page that you need to keep X/Y/Z between zero and PI for each axis. In the houdini version you needed to remap the point numbers (@ptnum) by the resolution (divisions) of the square but since our UV coordinates are already normalized we can skip that.

So we just need to multiply our R and G components by PI to have our UV mapped 0 to PI 

Which we can do like this
<img class="special-img-class" style="width:100%" src="/img/blog/UE/Chladni/UE_Chladni_Angle.jpg" title="Angles">
<sup>*Open in new tab to view larger image*</sup>

Then you can wrap up the final part of the equation like so. I've used a period of 6.28 in the cosine node. 
Which should equate to 1Hz, but I haven't been able to recreate the same frequencies I've seen online with that.

*I still need to read more about this, but if you can correct please do*
<img class="special-img-class" style="width:100%" src="/img/blog/UE/Chladni/UE_Chladni_Cosine.jpg" title="Chladni_MaterialGraph">
<sup>*Open in new tab to view larger image*</sup>

<img class="special-img-class" style="width:100%" src="/img/blog/UE/Chladni/UE_Chladni_Animated.gif" title="Chaldi_GIF">
And everything has worked out, it should look like this.

1 ) Effect as above

2 ) World Position Offset

3 ) Radial Coordinates 


To try and replicate the oscilloscopes that normally show this type of effect using Hertz, I made a custom hlsl node and multiplied the cosine period to see it dynamically. 
<img class="special-img-class" style="width:100%" src="/img/blog/UE/Chladni/UE_Chladni_CustomCosine.jpg" title="Custom Cosine">
<sup>*Open in new tab to view larger image*</sup>


## Version 2.0
----
Ok, so some further investigation lead me to some other algorithm variations of the effect that is more what I'm expecting and I'm able to recreate the patterns that are on the paulbourke page. 

Here is my material graph, which is a bit simpler and means I'm able to recreate the patterns shown on various youtube videos [for example](https://www.youtube.com/watch?v=wvJAgrUBF4w)



<img class="special-img-class" style="width:100%" src="/img/blog/UE/Chladni/UE_Chladni_Sine_v2.jpg" title="OriginalPatterns">
<sup>*Open in new tab to view larger image*</sup>


<img class="special-img-class" style="width:100%" src="/img/blog/UE/Chladni/UE_Chladni_Recreate.jpg" title="RecreatedPatterns">
<sup>*Open in new tab to view larger image*</sup>

I almost recreated all the patterns shown on the illustration from the original Chladni publication, some of them were just too tricky to get. 
Will continue updating this post if I manage to find the settings for the incorrect & blurred tiles.