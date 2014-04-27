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
Clone into, or download, the repository. Copy the folder called `Library` and import KosherCocoa.h. If you only want sunrise and sunset, you can copy the folder called `Solar` and ignore the rest.

CocoaPods is not yet an option, but it's in the works.

Technical Requirements:
---
The latest version of KosherCocoa has been developed with the iOS 7 SDK and uses ARC. You'll need Xcode 5 to make it work, because unit tests are built with XCTest.

Even if your project doesn't use ARC, you'll want to compile KosherCocoa with ARC. Use the `-fobjc-arc` compiler flag for that.

Using KosherCocoa:
---
See the [full documentation](https://github.com/MosheBerman/KosherCocoa/blob/master/Documentation.md) or poke around the file headers. Most things take just a few lines of code.

License:
---
KosherCocoa is hereby released under the modified LGPL License, version 2.1. See [the full text of the license](http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html) on the GNU website.
