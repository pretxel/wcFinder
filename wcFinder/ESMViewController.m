//
//  ESMViewController.m
//  wcFinder
//
//  Created by Edsel Serrano on 16/04/14.
//  Copyright (c) 2014 Edsel Serrano. All rights reserved.
//

#import "ESMViewController.h"
#import "AFNetworking.h"
#import "ESMClientWC.h"

@interface ESMViewController ()

@end

@implementation ESMViewController

    static NSString * const BaseURLString = @"http://restwc.herokuapp.com/";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    
    if([CLLocationManager locationServicesEnabled]){
        self.locationManager.delegate = self;
        
        
        [self.locationManager startUpdatingLocation];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//En este método utilizo las coordenadas y puedo parar o no la actualización de posición.
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    // Si solo lo necesitamos una vez podemos dejar de actualizar las coordenadas aunque el usuario se mueva.
    
    [self.locationManager stopUpdatingLocation];
    
    
    //Obtenemos las coordenadas.
    latitud = newLocation.coordinate.latitude;
    longitud = newLocation.coordinate.longitude;
    
    self.latitud = [[NSNumber numberWithFloat:latitud] stringValue];
    self.longitud = [[NSNumber numberWithFloat:longitud] stringValue];
    
    // Lo mostramos en las etiquetas
    //    latitudLabel.text = [NSString stringWithFormat:@"%0.8f",latitud];
    //    longitudLabel.text = [NSString stringWithFormat:@"%0.8f",longitud];
    
}

-(IBAction)locationAction:(id)sender{
    
    //    float latitud = self.locationManager.location.coordinate.latitude;
    //    float longitud = self.locationManager.location.coordinate.longitude;
    // Lo mostramos en las etiquetas
    if([CLLocationManager locationServicesEnabled]){
        self.locationManager.delegate = self;
        
        
        [self.locationManager startUpdatingLocation];
    }
    
    latitudLabel.text = [NSString stringWithFormat:@"%0.8f",latitud];
    longitudLabel.text = [NSString stringWithFormat:@"%0.8f",longitud];
    
}

//Método que envia datos de psosición al servicio RESTFULL
-(IBAction)sendLocation:(id)sender{

    NSLog(@"Entra Send");

    self.latitud = [[NSNumber numberWithFloat:self.locationManager.location.coordinate.latitude] stringValue];
    self.longitud = [[NSNumber numberWithFloat:self.locationManager.location.coordinate.longitude] stringValue];
    
    NSDictionary *params = @{
                             @"latitud"         : self.latitud,
                             @"longitud"    : self.longitud,
                             @"descripcion"    : @"Contenido de la nota"
                             };
    
    ESMClientWC *clienteWC = [[ESMClientWC client] initWithBaseURL:[NSURL URLWithString:BaseURLString]];
    
    [clienteWC sendPosicion:params];
    
 }

@end
