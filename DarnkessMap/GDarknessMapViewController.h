//
//  GSecondViewController.h
//  DarnkessMap
//
//  Created by Emiliano Burgos on 2/23/13.
//  Copyright (c) 2013 Emiliano Burgos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCoreGPSController.h"
#import "GPUImage.h"


@interface GDarknessMapViewController : UIViewController <GCoreGPSControllerDelegate> {
	GCoreGPSController *CLController;
	IBOutlet UILabel *locLabel;
    
    //
    GPUImageVideoCamera *videoCamera;
    GPUImageOutput<GPUImageInput> *filter;
    GPUImageMovieWriter *movieWriter;
}

@property (nonatomic, strong) GCoreGPSController *CLController;
@property (strong, nonatomic) IBOutlet UILabel *locLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@property (strong, nonatomic) CLLocation* location;
@property (strong, nonatomic) NSMutableDictionary* payloadObject;

-(void) setupVideoCamera;

@end
