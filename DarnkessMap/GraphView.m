//
//  GraphView.m
//  DarnkessMap
//
//  Created by Genevieve Hoffman on 3/4/13.
//  Copyright (c) 2013 Emiliano Burgos. All rights reserved.
//

#import "GraphView.h"
#import <QuartzCore/QuartzCore.h>

@implementation GraphView
@synthesize rectColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        rectPos = 0;
        
        rectArr = [[NSMutableArray alloc] init];
        self.opaque = NO;
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    // Replace contents of drawRect with the following:
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    UIColor *rColor = [UIColor colorWithRed:rectColor green:rectColor blue:rectColor alpha:1.0];
    
    [rectArr addObject:rColor];
    for (int i = 0; i< [rectArr count]; i++){
        
        UIColor * curRectColor = [rectArr objectAtIndex:i];
        CGRect curRect = CGRectMake(i, rect.origin.y, 1, rect.size.height);
        [self drawWithRect: curRect inContext: context andColor: curRectColor];
        
    }
    
    if ([rectArr count] >= self.bounds.size.width){
        CGContextClearRect(context, self.bounds);
        [rectArr removeAllObjects];
    }
}


- (void) drawWithRect: (CGRect)rect inContext: (CGContextRef)context andColor: (UIColor *)theRectColor {
    
    CGContextAddRect(context, rect);
    CGContextSetFillColorWithColor(context, theRectColor.CGColor);
    CGContextFillRect(context, rect);
}


@end
