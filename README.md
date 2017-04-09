KosherCocoa
===========

KosherCocoa is library that allows you to use sunrise, sunset, Jewish holidays, and other Hebrew calendar calculations in your app.

Features:
---
KosherCocoa offers six distinct features, each provided by a set of classes in the library. They are:

- Sunrise/Sunset - When the sun rises and sets at a given latitude, longitude, and altitude.
- Zmanim - Shema, Zman Tefila, Chatzos, and more.
- Parashat Hashavua - Weekly torah portion, with schedules for *Israel* and *Chul*.
- Sefira - The omer count between Passover and Shavuot.  
- Daf Yomi - The daily talmud study program followed by thousands of Jews worldwide.
- Chagim - When Jewish holidays fall.

Setting it up:
---
Clone into the repository. 

Drag the KosherCocoa Xcode project into your own and add KosherCocoa framework as a dependency. If you're targeting iOS 7, add KosherCocoa.h and the `Library` directory to your project.


**CocoaPods:** KosherCocoa 3.0.2 supports CocoaPods. Add the following line to your podfile:

```
'KosherCocoa', '~> 3.5.1'
```

Technical Requirements:
---
The latest version of KosherCocoa has been developed with the iOS 9 SDK and Xcode 7. To use the Framework, you'll need to target iOS 8 or newer.

Using KosherCocoa:
---
Read the [documentation](https://github.com/MosheBerman/KosherCocoa/blob/master/Documentation.md) or poke around the file headers. 

License:
---
KosherCocoa is hereby released under the modified LGPL License, version 2.1. See [the full text of the license](http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html) on the GNU website.
