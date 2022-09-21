+++
title = "Curvature"
date = "2017-07-10T19:44:32+05:30"
image = "img/blog/UE/UE_ScreenspaceCurvature.jpg"
draft = false
showonlyimage = false
categories = [ "Unreal"]
tags = [ "Unreal", "Shader", "GLSL","Curvature", "UE4", "UE5"]
weight = 1
description = "Reload modified Maya textures within timeframe."
+++

UE4 ScreenSpace Curvature GLSL Port
<!--more-->
{{< load-photoswipe >}}

Ported over a GLSL shader from [**MadeByEvan**](http://madebyevan.com/shaders/curvature/) to Unreal as a Material Function for doing ScreenSpace Curvature.
Also converted a more simplified version from Epic into nodes as well.
{{< yt Qmi9LgH5N2E >}}
The normals are interpolated linearly so the faceting can't be fixed at the moment, but with higher resolution mesh or more math savy people (or UE4 will do smooth interpolated normals) this could be improved upon.  
Lemme know if you find it useful.
Built in 4.16 but can be for any version.

Link to forum post [**HERE**](https://forums.unrealengine.com/showthread.php?144724-FREE-Curvature-Shader)


{{< figure link="/img/blog/UE/UE_ScreenspaceCurvature_glsl.jpg" caption="Click to open" caption-effect="fade" caption-position="bottom" alt="GLSL Port - MadeByEven">}}

{{< figure link="/img/blog/UE/UE_ScreenspaceCurvature_epic.jpg" caption="Click to open" caption-effect="fade" caption-position="bottom" alt="Epic code in nodes">}}


{{< highlight glsl >}}
float NormalCurvatureToRoughness(float3 WorldNormal)
{
    float3 dNdx = ddx(WorldNormal);
    float3 dNdy = ddy(WorldNormal);
    float x = dot(dNdx, dNdx);
    float y = dot(dNdy, dNdy);
    float CurvatureApprox = pow(max(x, y), View.NormalCurvatureToRoughnessScaleBias.z);
	return saturate(CurvatureApprox * View.NormalCurvatureToRoughnessScaleBias.x + View.NormalCurvatureToRoughnessScaleBias.y);
}
{{< /highlight >}}

[MF_CurvatureNode](/downloads/MF_CurvatureNode.zip)  
[MF_CurvatureRoughness](/downloads/MF_CurvatureRoughness.zip)