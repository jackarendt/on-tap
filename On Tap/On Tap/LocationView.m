//
//  LocationView.m
//  On Tap
//
//  Created by Jack Arendt on 12/23/14.
//  Copyright (c) 2014 John Arendt. All rights reserved.
//

#import "LocationView.h"
#import "OTConstants.h"

@interface LocationView ()
@property (nonatomic, strong) UILabel *locationLabel;
@property (nonatomic, strong) UILabel *facebookLabel;
@property (nonatomic, strong) UISwitch *locationSwitch;
@property (nonatomic, strong) UISwitch *facebookSwitch;
@end

@implementation LocationView

-(instancetype)init {
    self = [super init];
    if(self) {
        [self setupView];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self setupView];
    }
    return self;
}

-(void)setupView {
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 1.0;
    self.locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.bounds.size.width - 70, 30)];
    self.locationLabel.text = @"Location Services:";
    self.locationLabel.font = [UIFont fontWithName: mainFont size:17.0];
    [self addSubview:self.locationLabel];
    
    self.facebookLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, self.bounds.size.width - 70, 30)];
    self.facebookLabel.text = @"Visible to Facebook Friends:";
    self.facebookLabel.font = [UIFont fontWithName:mainFont size:17.0];
    [self addSubview:self.facebookLabel];
    
    self.locationSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(self.bounds.size.width - 65, 10, 51, 31)];
    [self addSubview: self.locationSwitch];
    
    self.facebookSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(self.bounds.size.width - 65, 50, 51, 31)];
    [self addSubview:self.facebookSwitch];
}
@end
