//
//  ESMViewController.h
//  wcFinder
//
//  Created by Edsel Serrano on 16/04/14.
//  Copyright (c) 2014 Edsel Serrano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ESMViewController : UIViewController
{
    CLLocationManager *locationManager;
    float longitud;
    float latitud;
    
    IBOutlet UILabel *latitudLabel;
    IBOutlet UILabel *longitudLabel;
    
}

@property(nonatomic, retain) CLLocationManager *locationManager;
@property(nonatomic, weak) NSString *latitud;
@property(nonatomic, weak) NSString *longitud;
-(IBAction)locationAction:(id)sender;
-(IBAction)sendLocation:(id)sender;
@end
