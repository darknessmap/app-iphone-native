//
//  GraphView.h
//  DarnkessMap
//
//  Created by Genevieve Hoffman on 3/4/13.
//  Copyright (c) 2013 Emiliano Burgos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraphView : UIView {
   
    int totalSize;
    CGFloat rectPos;
    NSMutableArray *rectArr;
}

- (void) drawWithRect: (CGRect) rect inContext: (CGContextRef) context andColor: (UIColor *) theRectColor;
@property CGFloat rectColor;

@end
