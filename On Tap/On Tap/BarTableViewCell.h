//
//  BarTableViewCell.h
//  On Tap
//
//  Created by Jack Arendt on 12/23/14.
//  Copyright (c) 2014 John Arendt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressBar.h"

@interface BarTableViewCell : UITableViewCell

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *activeFriends;
@property float progress;
@property BOOL cover;
@property (nonatomic, strong) NSString *barImageString;

-(void)setCapacity:(float)capacity;
-(void)createView:(float)capacity;

@end
