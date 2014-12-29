//
//  ProgressBar.h
//  On Tap
//
//  Created by Jack Arendt on 12/23/14.
//  Copyright (c) 2014 John Arendt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressBar : UIView
-(instancetype)init;
-(instancetype)initWithFrame:(CGRect)frame;
-(instancetype)initWithFrame:(CGRect)frame progress:(float)p;
-(void)updateProgress:(float)p;
-(float)getProgress;
@end
