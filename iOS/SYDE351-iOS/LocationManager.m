//
//  LocationManager.m
//  SYDE351-iOS
//
//  Created by Karan Thukral on 2015-07-08.
//  Copyright (c) 2015 karanthukral. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager
{
    CLLocationManager *_locationManager;
    CLLocation *_location;
    float _latitude;
    float _longitude;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        [self startLocation];
    }
    return self;
}

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    static LocationManager *__sharedManager;
    dispatch_once(&onceToken, ^{
        __sharedManager = [[[self class] alloc] init];
    });
    return __sharedManager;
}

- (void)startLocation
{
    [_locationManager setDistanceFilter: kCLDistanceFilterNone];
    [_locationManager setDesiredAccuracy: kCLLocationAccuracyBest];
    
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"Location service not available");
    }
    
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status == kCLAuthorizationStatusRestricted || status == kCLAuthorizationStatusDenied) {
        NSLog(@"Location service is restriced or is denied");
    } else if (status == kCLAuthorizationStatusNotDetermined) {
        [_locationManager requestWhenInUseAuthorization];
    }
    
    [_locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    _location = [locations lastObject];
    _latitude = _location.coordinate.latitude;
    _longitude = _location.coordinate.longitude;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Fail to handle location: %@", error);
    
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"Location service not available");
    }
    
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status == kCLAuthorizationStatusRestricted || status == kCLAuthorizationStatusDenied) {
        NSLog(@"Location service is restriced or is denied");
    }
}

- (float)currentLatitude {
    return _latitude;
}

- (float)currentLongitude {
    return _longitude;
}


@end
