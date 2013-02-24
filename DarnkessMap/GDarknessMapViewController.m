//
//  GSecondViewController.m
//  DarnkessMap
//
//  Created by Emiliano Burgos on 2/23/13.
//  Copyright (c) 2013 Emiliano Burgos. All rights reserved.
//

#import "GDarknessMapViewController.h"
#import "GPayload.h"
#import "GServiceGateway.h"

@interface GDarknessMapViewController ()

@end



@implementation GDarknessMapViewController

@synthesize locLabel, CLController, location, payloadObject;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
	CLController = [[GCoreGPSController alloc] init];
	CLController.delegate = self;
	[CLController.locMgr startUpdatingLocation];
}

- (void)locationUpdate:(CLLocation *)aLocation {
    self.location = aLocation;
    
	locLabel.text = [self.location description];
    
    //test the fucking JSONnify of the payload.
    
    NSNumber* lon = [NSNumber numberWithDouble:34.5555333];
    NSNumber* lat = [NSNumber numberWithDouble:72.3434423];
    int time = 222222222;
    NSInteger* timestamp = &time;
    NSString* uid = @"lasdjflajdsfl";
    NSString* sid = @"lasdjflajdsfl";
    
    GPayload* payload = [[GPayload alloc] initWithUid:uid sid:sid];
    
    NSDictionary* loc = [NSDictionary dictionaryWithObjectsAndKeys:lon,@"lon", lat, @"lat",nil];
    
    [payload setPayload:lon
               location:loc
              timestamp:timestamp];
    
    payloadObject = [NSMutableDictionary dictionary];
    
    NSString* json = [payload getAsJsonString:payloadObject];
    
    NSLog(@"fuck: %@", json);
   
    
    GServiceGateway* gateway = [[GServiceGateway alloc] init];
    
    //TODO: Get the IP/end point url from a config file :)
    NSString* url = @"http://192.168.208.148/phpTest/server/index.php";
    NSDictionary* data = [NSDictionary dictionaryWithObjectsAndKeys:json,@"data", nil];
    
    [gateway connectionPOST:url withParams:data];
    
}

- (void)locationError:(NSError *)error {
	locLabel.text = [error description];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
