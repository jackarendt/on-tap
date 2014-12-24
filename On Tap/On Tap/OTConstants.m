//
//  OTConstants.m
//  On Tap
//
//  Created by Jack Arendt on 12/23/14.
//  Copyright (c) 2014 John Arendt. All rights reserved.
//

#import "OTConstants.h"

@implementation OTConstants

NSString * const mainFont = @"STHeitiTC-Light";

//Main Color
float const mainRed = 0.0;
float const mainGreen = 0.454;
float const mainBlue = 0.8157;

//Secondary Color
float const secondaryRed = 0.0;
float const secondaryGreen = 0.122;
float const secondaryBlue = 0.247;

//Main Facebook Blue
float const fbRed = 0.2313;
float const fbGreen = 0.349;
float const fbBlue = 0.596;

//Highlighted Facebook Blue
float const lightFBRed = 0.545;
float const lightFBGreen = 0.6125;
float const lightFBBlue = 0.7647;


//Converts a UIColor to a UIImage
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
