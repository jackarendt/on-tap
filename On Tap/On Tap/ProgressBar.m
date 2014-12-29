//
//  ProgressBar.m
//  On Tap
//
//  Created by Jack Arendt on 12/23/14.
//  Copyright (c) 2014 John Arendt. All rights reserved.
//

#import "ProgressBar.h"
#import "OTConstants.h"

@interface ProgressBar (){
    float progress;
    UIImageView *layer;
}
@end

@implementation ProgressBar

#pragma mark - init functions
-(instancetype)init {
    self = [super init];
    if(self) {
        [self createView];
        [self updateProgress:0];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self createView];
        [self updateProgress:0];
        
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame progress:(float)p {
    self = [super initWithFrame:frame];
    if(self) {
        [self createView];
        [self updateProgress:p];
    }
    return self;
}

-(void)createView {
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 1.0;
    layer = [[UIImageView alloc] initWithFrame:CGRectZero];
    layer.frame = CGRectMake(0, 0, 0, self.bounds.size.height);
    layer.image = [OTConstants imageWithColor:[UIColor colorWithRed:mainRed green:mainGreen blue:mainBlue alpha:1.0f]];
    [self addSubview:layer];
    
}

/**
 ** Updates the progress value, and appropriately fills in the progress bar
 **/
-(void)updateProgress:(float)p {
    if(p > 1.0)
        progress = 1.0;
    else if(p < 0.0)
        progress = 0.0;
    else
        progress = p;
    
    layer.frame = CGRectMake(0, 0, p * self.bounds.size.width, layer.bounds.size.height);
}

//Returns value of the progress bar
-(float)getProgress {
    return progress;
}

@end
