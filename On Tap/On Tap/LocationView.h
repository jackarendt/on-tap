//
//  LocationView.h
//  On Tap
//
//  Created by Jack Arendt on 12/23/14.
//  Copyright (c) 2014 John Arendt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LocationViewDelegate <NSObject>

-(void)locationValuesDidChange:(BOOL)location facebookVisible:(BOOL)visible;
@end

@interface LocationView : UIView
@property id<LocationViewDelegate> delegate;
@end
