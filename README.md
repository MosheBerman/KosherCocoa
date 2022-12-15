KosherCocoa
===========

KosherCocoa is library that allows you to use sunrise, sunset, Jewish holidays, and other Hebrew calendar calculations in your app.

Features:
---
KosherCocoa offers seven distinct features, each provided by a set of classes in the library. They are:

- Sunrise/Sunset - When the sun rises and sets at a given latitude, longitude, and altitude.
- Zmanim - Shema, Zman Tefila, Chatzos, and more.
- Zmanim Metadata - How each zman is calculated, related zmanim, and the calculation's name in Hebrew, English, and two flavors of transliterated English. (Help [translate this into other spoken languages](https://github.com/MosheBerman/KosherCocoa/issues/127).)
- Parashat Hashavua - Weekly torah portion, with schedules for *Israel* and *Chul*.
- Sefira - The omer count between Passover and Shavuot.  
- Daf Yomi - The daily talmud study program followed by thousands of Jews worldwide.
- Chagim - When Jewish holidays fall.

Setting it up:
---
Clone into the repository. 

Drag the KosherCocoa Xcode project into your own and add KosherCocoa framework as a dependency.

**CocoaPods:** KosherCocoa supports CocoaPods as of version 3.0.2. Add the following line to your podfile:

```
'KosherCocoa', '~> 3.6.0'
```

Technical Requirements:
---
The latest version of KosherCocoa has been developed with the iOS 9 SDK and Xcode 8. To use the Framework, you'll need to target iOS 8 or higher, macOS 10.11 or higher, tvOS 9.0 or higher, or watchOS 2.0 or higher.

Using KosherCocoa:
---
Read the [documentation](https://github.com/MosheBerman/KosherCocoa/blob/master/Documentation.md) or poke around the file headers. 

Contributing:
---

If you'd like to help localize this framework so users of other languages can benefit, please [see this issue](https://github.com/MosheBerman/KosherCocoa/issues/127).

License:
---
KosherCocoa is hereby released under the modified LGPL License, version 2.1. See [the full text of the license](http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html) on the GNU website. One additional modification to the license is below:

> By using this project in your app, you represent that your app does not replicate Ultimate Zmanim in primary functionality or in appearance. You agree not to release an app which includes a list of zmanim as its primary function, neither paid nor for free. An example of an acceptable use is to dynamically change contents of a siddur app, or calculate the weekly torah reading in a chumash app. You further agree to comply with any and all takedown requests.
> 
> This clause is not intended to change or override anything in the LGPL 2.1 license, nor is it intended to override local laws and regulations.
 
Basically, I'm tired of copycat apps, so please stop.

Thanks!
---
Please let me know if you're using the KosherCocoa framework in your app! 
