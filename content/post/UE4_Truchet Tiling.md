+++
title = "UE4 Truchet Tiling"
date = "2019-07-24T08:00:32+05:30"
image = "img/blog/UE4/Truchet/UE4_TruchetTiling.jpg"
draft = false
showonlyimage = false
categories = ["UE4", "Shader"]
tags = ["Truchet", "Shader", "UV"]
weight = 1
description = "Truchet uv tiling"
+++

Exploring Truchet Tiling
<!--more-->

I recently came across the Truchet tiling method. 
It's a fascinatingly simple idea and works really nice for aesethic patterns

A variety of patterns can be formed by taking one or many images and rotating it for each edge.

<img class="special-img-class" style="width:100%" src="/img/blog/UE4/Truchet/UE4_TruchetTiling_01.jpg" title="Patterns"/>
<center>Clipped from [Wikipedia](https://en.wikipedia.org/wiki/Truchet_tiles)</center>

First step is create a repeating uv tile.
<img class="special-img-class" style="width:100%" src="/img/blog/UE4/Truchet/UE4_TruchetTiling_02.jpg" title="Repeating UVs"/>

Next we'll use a noise image but down res it, by grabbing the nearest interger and then scaling it down by the repeats.
<img class="special-img-class" style="width:100%" src="/img/blog/UE4/Truchet/UE4_TruchetTiling_03.jpg" title="Mosaic UVs"/>

In order to rotate our image around each repeated cell, we need normalized values between 0 and 1 and for each image to rotate in 90 degree turns we need 0.25, 0.5, 0.75 for our rotator.
So if you posterize the image by using the same technique above but not on the uv's you get the right values.

<img class="special-img-class" style="width:100%" img src="/img/blog/UE4/Truchet/UE4_TruchetTiling_04.jpg" onmouseout="this.src='/img/blog/UE4/Truchet/UE4_TruchetTiling_04.jpg';" onmouseover="this.src='/img/blog/UE4/Truchet/UE4_TruchetTiling_04a.jpg';" title="Posterize values"/>
*(Mouse over)*

Then we just plug in our first uv tile graph into a customRotator and then plug in the noise  as the rotation values, connect that into the uv's of our image sample and it will give us the unique Truchet tiling patterns.
<img class="special-img-class" style="width:100%" src="/img/blog/UE4/Truchet/UE4_TruchetTiling_05.jpg" title="Truchet UVs"/>

Try using other patterns and more images, I found these online and connected it all up.
<img class="special-img-class" style="width:100%" src="/img/blog/UE4/Truchet/UE4_TruchetTiling_06.jpg" title="Truchet UVs"/>
<img class="special-img-class" style="width:100%" src="/img/blog/UE4/Truchet/UE4_TruchetTiling_07.jpg" title="Patterns"/>

There are more methods and more ways to combine with this tiling pattern. Here's one I found from Wyeth Johnson
<img class="special-img-class" style="width:100%" src="/img/blog/UE4/Truchet/UE4_TruchetTiling_08.jpg" title="WyethJohnson"/>

You can also try combining this with SignedDistanceFields (SDFs) to make more crazy interesting patterns.
<img class="special-img-class" style="width:100%" src="/img/blog/UE4/Truchet/UE4_TruchetTiling_09_SDF.gif" title="WyethJohnson"/>