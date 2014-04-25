KosherCocoa Documentation:
===

Table of Contents
---

1. Introduction
2. Sunrise, Sunset: Calculating Sunrise
3. Zmanim
4. Around the Year: Parasha, Chagim, Sefira, and Daf Yomi


1. Introduction
---

KosherCocoa is the product of over two years spent porting Eliyahu Hershfeld's wonderful KosherJava library to Objective-C. Much of this time has been spent maturing the library and making it feel like some of the Cocoa APIs. Eliyahu's own work has taken a significant amount of time and effort. 

This document attempts to be a complete reference for how to use Objective-C version. Please be mindful of the possibility that people will attempt to use whatever products you may build with this library to enhance their religious observance. If my own experience basing products on various iterations of this code has taught me one thing it is to be careful. 

With that in mind, let's get started.

2. Sunrise, Sunset: Calculating Sunrise
---
Sunrise and sunset are defined by where you are on Earth. For example, sunrise in California is long after sunrise in New York. While we use time zones to handle this when discussing time, we need to pinpoint where our user is in order to show them times that they can relate to. To do so, we use the KCGeoLocation class. 

