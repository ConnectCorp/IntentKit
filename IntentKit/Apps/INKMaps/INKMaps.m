//
//  INKMaps.m
//  IntentKit
//
//  Created by Kyle Fleming on 4/24/15.
//
//

#import "INKMaps.h"

#import <MapKit/MapKit.h>

@implementation INKMaps

- (BOOL)canPerformAction:(NSString *)action {
    return YES;
}

- (void)performAction:(NSString *)action
               params:(NSDictionary *)params
     inViewController:(UIViewController *)presentingViewController {
    NSString *name = params[@"name"];
    double latitude = [params[@"latitude"] doubleValue];
    double longitude = [params[@"longitude"] doubleValue];
    
    CLLocationCoordinate2D coordinates = CLLocationCoordinate2DMake(latitude, longitude);
    MKPlacemark *place = [[MKPlacemark alloc] initWithCoordinate:coordinates addressDictionary:nil];
    MKMapItem *destination = [[MKMapItem alloc] initWithPlacemark:place];
    destination.name = name;
    
    NSArray *items = @[destination];
    NSDictionary *options = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
    [MKMapItem openMapsWithItems:items launchOptions:options];
}

@end
