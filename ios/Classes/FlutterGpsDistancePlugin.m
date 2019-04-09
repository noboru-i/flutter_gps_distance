#import "FlutterGpsDistancePlugin.h"

#import <CoreLocation/CoreLocation.h>

@implementation FlutterGpsDistancePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_gps_distance"
            binaryMessenger:[registrar messenger]];
  FlutterGpsDistancePlugin* instance = [[FlutterGpsDistancePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"calculateDistance" isEqualToString:call.method]) {
    NSArray* args = (NSArray*)call.arguments;
    NSLog(@"start latitude : %f", [args[0] doubleValue]);
    NSLog(@"start longitude : %f", [args[1] doubleValue]);
    NSLog(@"end latitude : %f", [args[2] doubleValue]);
    NSLog(@"end longitude : %f", [args[3] doubleValue]);
    CLLocation* locationA = [[CLLocation alloc] initWithLatitude:[args[0] doubleValue] longitude:[args[1] doubleValue]];
    CLLocation* locationB = [[CLLocation alloc] initWithLatitude:[args[2] doubleValue] longitude:[args[3] doubleValue]];

    double distance = [locationA distanceFromLocation:locationB];
    NSLog(@"distance : %f", distance);
    result(@(distance));
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
