//
//  HomeViewController.h
//  On Tap
//
//  Created by Jack Arendt on 12/23/14.
//  Copyright (c) 2014 John Arendt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationView.h"

@interface HomeViewController : UIViewController <LocationViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
