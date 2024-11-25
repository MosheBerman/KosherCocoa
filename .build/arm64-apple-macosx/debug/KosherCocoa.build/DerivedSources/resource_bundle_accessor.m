#import <Foundation/Foundation.h>

NSBundle* KosherCocoa_SWIFTPM_MODULE_BUNDLE() {
    NSURL *bundleURL = [[[NSBundle mainBundle] bundleURL] URLByAppendingPathComponent:@"KosherCocoa_KosherCocoa.bundle"];

    NSBundle *preferredBundle = [NSBundle bundleWithURL:bundleURL];
    if (preferredBundle == nil) {
      return [NSBundle bundleWithPath:@"/Users/mosheberman/Developer/KosherCocoa/.build/arm64-apple-macosx/debug/KosherCocoa_KosherCocoa.bundle"];
    }

    return preferredBundle;
}