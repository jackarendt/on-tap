//
//  OTConstants.h
//  On Tap
//
//  Created by Jack Arendt on 12/23/14.
//  Copyright (c) 2014 John Arendt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OTConstants : NSObject
extern NSString * const mainFont;

extern float const mainRed;
extern float const mainGreen;
extern float const mainBlue;

extern float const secondaryRed;
extern float const secondaryGreen;
extern float const secondaryBlue;

extern float const fbRed;
extern float const fbGreen;
extern float const fbBlue;

extern float const lightFBRed;
extern float const lightFBGreen;
extern float const lightFBBlue;

+ (UIImage *)imageWithColor:(UIColor *)color;
@end
