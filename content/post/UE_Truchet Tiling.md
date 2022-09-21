+++
title = "Truchet Tiling"
date = "2019-07-24T08:00:32+05:30"
image = "img/blog/UE/Truchet/UE_TruchetTiling.jpg"
draft = false
showonlyimage = false
categories = ["Unreal"]
tags = ["Truchet", "Shader", "UVs", "UE4", "UE5", "Unreal"]
weight = 1
description = "Truchet uv tiling"
+++

Exploring Truchet Tiling
<!--more-->
{{< load-photoswipe >}}


I recently came across the Truchet tiling method. 
It's a fascinatingly simple idea and works really nice for aesethic patterns

A variety of patterns can be formed by taking one or many images and rotating it for each edge.


{{< figure link="/img/blog/UE/Truchet/UE_TruchetTiling_01.jpg" caption="Click to open" caption-effect="fade" caption-position="bottom" alt="Clipped from [Wikipedia](https://en.wikipedia.org/wiki/Truchet_tiles)">}}

First step is create a repeating uv tile.
{{< figure link="/img/blog/UE/Truchet/UE_TruchetTiling_02.jpg" caption="Click to open" caption-effect="fade" caption-position="bottom" alt="Repeated UVs">}}


Next we'll use a noise image but down res it, by grabbing the nearest interger and then scaling it down by the repeats.
{{< figure link="/img/blog/UE/Truchet/UE_TruchetTiling_03.jpg" caption="Click to open" caption-effect="fade" caption-position="bottom" alt="Mosaic the UVs">}}


In order to rotate our image around each repeated cell, we need normalized values between 0 and 1 and for each image to rotate in 90 degree turns we need 0.25, 0.5, 0.75 for our rotator.
So if you posterize the image by using the same technique above but not on the uv's you get the right values.

{{< figure link="/img/blog/UE/Truchet/UE_TruchetTiling_04a.jpg" caption="Click to open" caption-effect="fade" caption-position="bottom" alt="Posterize the values">}}


Then we just plug in our first uv tile graph into a customRotator and then plug in the noise  as the rotation values, connect that into the uv's of our image sample and it will give us the unique Truchet tiling patterns.
{{< figure link="/img/blog/UE/Truchet/UE_TruchetTiling_05.jpg" caption="Click to open" caption-effect="fade" caption-position="bottom" alt="Truchet UVs">}}

Try using other patterns and more images, I found these online and connected it all up.
{{< figure link="/img/blog/UE/Truchet/UE_TruchetTiling_06.jpg" caption="Click to open" caption-effect="fade" caption-position="bottom" alt="Truchet UVs">}}
{{< figure link="/img/blog/UE/Truchet/UE_TruchetTiling_07.jpg" caption="Click to open" caption-effect="fade" caption-position="bottom" alt="Patterns">}}


There are more methods and more ways to combine with this tiling pattern. Here's one I found from Wyeth Johnson
{{< figure link="/img/blog/UE/Truchet/UE_TruchetTiling_08.jpg" caption="Click to open" caption-effect="fade" caption-position="bottom" alt="WyethJohnson">}}

You can also try animating them for something different
{{< figure link="/img/blog/UE/Truchet/UE_TruchetTiling_09_SDF.gif" caption="Click to open" caption-effect="fade" caption-position="bottom" alt="Animated gif">}}


