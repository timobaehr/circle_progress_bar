#import "CircleProgressBarPlugin.h"
#if __has_include(<circle_progress_bar/circle_progress_bar-Swift.h>)
#import <circle_progress_bar/circle_progress_bar-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "circle_progress_bar-Swift.h"
#endif

@implementation CircleProgressBarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCircleProgressBarPlugin registerWithRegistrar:registrar];
}
@end
