+++
title = "Facet Scaling"
date = "2022-09-22T00:09:00+09:30"
image = "img/blog/UE/Facet/UE_FacetScaling.jpg"
draft = false
showonlyimage = false
categories = [ "unreal", "houdini"]
tags = ["ue4", "ue5", "unreal", "shader", "facet", "houdini"]
weight = 1
description = "Scales centers of face centroid"
+++
Facet Scaling in a shader
<!--more-->

{{< load-photoswipe >}}

So this technique is an old one, but something I've wanted to try for a while. 

Here is the effect i used it in.
{{< figure link="/img/blog/UE/Facet/UE_FacetScaling__Statue.gif" caption="Click to open" caption-effect="fade" caption-position="bottom">}}

The position of each face is encoded with vertex colors and used to control scaling/rotation or whatever you like in Unreal. 
It is outdated now since Houdini and UE5 can bake these type of effects into additional uv channels or data textures.
But it is something I've wanted to get working for some time.

Vertex colors are stored as 8bit data, which means 256 colours and as floating point becomes 1/255 which equals a precision of only 0.004. 
The larger the object or further away from the origin the more the problems magnify.

So one of the reasons to get it working was wanting recreate this effect I saw from Keijiro Takahashi
<center>{{< tweet user="kzr" id="929017717532659712" >}}</center>

­

---

### Houdini

So to get the following this is what I did.

In Houdini (this can be done in any software), I created the following network of nodes, the meat of the network is the color node.
If you want to use a point wrangle you can just use @Cd = relbbox(0, @P);

First thing we do is facet the polygons so that each face has unique points and not fused together.
Then we encode the relative bounding box colors to the points, promote those colors from point to prims then back so that they are uniform per prim.
Transform it so that the object is somewhat the correct scale for Unreal and the rotation and negative scale is to get it in the correct coordinate space. Z-Up.

{{< figure link="/img/blog/UE/Facet/HOU_Network.jpg" caption="Houdini Network Graph" caption-effect="fade" caption-position="bottom">}}

All the relevant node settings. 
{{< figure link="/img/blog/UE/Facet/HOU_Network_Settings.jpg" height="50px" caption="Network settings" caption-effect="fade" caption-position="bottom">}}
Export it out to FBX.

­

---
#### Unreal
In Unreal, we read the vertex colors which range from 0 to 1 and remap them to -1 to +1, scale it by the bounds and then add the current local offset.
We next subtract their current vertex position by the prim center position that is encoded to the get the world space position.
Which now allows us to scale them towards the centre of the face.
{{< figure link="/img/blog/UE/Facet/UE_VertexColorToPosition.jpg" caption="Vertex Color to Position" caption-effect="fade" caption-position="bottom">}}

To get the animation looking nice, I multiply the scaling effect by an animated noise.
I've just connected a couple of Collection Parameter to help get the settings right. I've annotated the values I ended up using for them, but feel free to make it whatever.
This all gets plugged into the worldPositionOffset in the shader. Which is also set to wireframe.
The material functions I've got in there aren't important to the effect, they are just helpers I've created to simplify what I often do, the regular smoothstep is used inside it.
{{< figure link="/img/blog/UE/Facet/UE_ScaleNoise.jpg" caption="Noise Animation" caption-effect="fade" caption-position="bottom">}}

The exact same process is used for the lines.

I exported out a mesh that was a spikey ball and I used the same shader except I remap it to go between -2 and 2 using a Lerp and plugging in the noise into the alpha of that Lerp. 

{{< figure link="/img/blog/UE/Facet/UE_SpikeyBall.jpg" caption="Noise Animation" caption-effect="fade" caption-position="bottom">}}

{{< figure link="/img/blog/UE/Facet/UE_FacetScaling__Statue.gif" caption="Click to open" caption-effect="fade" caption-position="bottom">}}
Finished product with animated statue and animated sine lines on the floor.