KosherCocoa
===========

*Making an app? Now's as good a time as any.* 

KosherCocoa is library that allows you to use sunrise, sunset, Jewish holidays, and other Hebrew calendar calculations in your app.

Features:
---
KosherCocoa can tell you when sunrise and sunset are. It can tell you if it's a Jewish holiday. It can even tell you what the [daf yomi cycle]() is up to or day of the [omer count]() it is.

Setting it up:
---
Clone into, or download, the repository. Copy the folder called `Library` and import KosherCocoa.h. If you only want sunrise and sunset, you can copy the folder called `Solar` and ignore the rest.

CocoaPods is not yet an option, but it's in the works.

Technical Requirements:
---
The latest version of KosherCocoa has been developed with the iOS 7 SDK and uses ARC. You'll need Xcode 5 to make it work, because unit tests are built with XCTest.


Even if your project doesn't use ARC, you'll want to compile KosherCocoa with ARC. Use the `-fobjc-arc` compiler flag for that.

License:
---
KosherCocoa is hereby released under the following modified LGPL License.

TODO: LGPL + modifications