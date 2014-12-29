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

//Main Font
extern NSString * const mainFont;

//Primary Color
extern float const mainRed;
extern float const mainGreen;
extern float const mainBlue;

//Secondary Color
extern float const secondaryRed;
extern float const secondaryGreen;
extern float const secondaryBlue;

//Main Facebook Color
extern float const fbRed;
extern float const fbGreen;
extern float const fbBlue;

//Secondary Facebook Color
extern float const lightFBRed;
extern float const lightFBGreen;
extern float const lightFBBlue;


/**
 ** This function takes a UIColor and translates it into a UIImage.
 ** Mainly used for when a tableview cell is being selected and you
 ** don't want the fill to go away.
 **/
+ (UIImage *)imageWithColor:(UIColor *)color;
@end
