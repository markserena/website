+++
title = "Mandlebrot Times Tables"
date = "2018-07-27T18:00:32+05:30"
image = "img/blog/UE/UE_Mandelbrot_Cardioid.jpg"
draft = false
showonlyimage = false
categories = [ "Unreal"]
tags = ["Mandlebrot", "Blueprint", "Times-table", "UE4", "UE5", "Unreal"]
weight = 1
description = "Create circular timestable using blueprint"
+++
Create circular timestable using UE Blueprints
<!--more-->

I was inspired by this Mathloger [**video**]( https://www.youtube.com/watch?v=qhbuKbxJsk8) to recreate this times-table cardioid circle.

<p align="center">
<img class="special-img-class" style="width:25%;" src="/img/blog/UE/UE_cardioid.gif" title="Cardioid_BP"/>
</p>
 It's basically an awesome way to visualize timestables in 2 dimensions.   

We create a for loop with the maximum number of connections we want to make.  
For the current index we want to get it's location on the circle so we put in a rotateVectorAroundAxis
to get it's position equally spaced on the circumference.

That gets feed into a Draw Debug Line function as the Line Start and for the Line End we simply do the same but 
insert out multiplier and we get our times-table Mandelbrot diagram.

<img class="special-img-class" style="width:100%" src="/img/blog/UE/UE_times-table_cardioid_bpGraph.jpg" title="Cardioid_BP"/>

In this blueprint I've also lowered the rotateVectorAroundAxis to aim for a vector underneath the original, which gives puts it in 3D.

{{< youtube sb2Y92fGXxo >}}


If you want to play with an interactive webGL version you can check [**here**](https://mathiaslengler.github.io/TimesTableWebGL/)