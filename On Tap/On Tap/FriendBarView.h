//
//  FriendBarView.h
//  On Tap
//
//  Created by Jack Arendt on 12/28/14.
//  Copyright (c) 2014 John Arendt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendBarView : UIView

-(instancetype)init;
-(instancetype)initWithFrame:(CGRect)frame;

-(void)createViewWithFriends:(NSArray *)arr;
-(void)createView;
-(void)updateFriendsList:(NSArray *)arr;

@end
