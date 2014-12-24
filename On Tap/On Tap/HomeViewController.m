//
//  HomeViewController.m
//  On Tap
//
//  Created by Jack Arendt on 12/23/14.
//  Copyright (c) 2014 John Arendt. All rights reserved.
//

#import "HomeViewController.h"
#import "LocationView.h"

@interface HomeViewController (){
    BOOL locationVisible;
}
@property (nonatomic, strong) LocationView *locationView;
@property (nonatomic, strong) UIBarButtonItem *locationButton;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    locationVisible = NO;
    self.navigationItem.title = @"On Tap";
    self.locationButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"locationIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(showLocationPreferences)];
    self.navigationItem.rightBarButtonItem = self.locationButton;
    
    UIBarButtonItem *profileButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"profileIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(showProfile)];
    self.navigationItem.leftBarButtonItem = profileButton;
    
    self.locationView = [[LocationView alloc] initWithFrame:CGRectMake(0, -90, self.view.bounds.size.width, 90)];
    
    [self.view addSubview:self.locationView];
    [self.locationView setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showLocationPreferences {
    if(locationVisible) {
        locationVisible = NO;
        [UIView animateKeyframesWithDuration:0.25 delay:0 options:UIViewKeyframeAnimationOptionAllowUserInteraction animations:^{
            self.locationView.frame = CGRectMake(0, -self.locationView.bounds.size.height, self.locationView.bounds.size.width, self.locationView.bounds.size.height);
        }completion:^(BOOL finished){
            [self.locationView setHidden:YES];
            self.locationButton.image = [UIImage imageNamed:@"locationIcon"];
        }];
    }
    
    else {
        locationVisible = YES;
        [self.locationView setHidden:NO];
        [UIView animateKeyframesWithDuration:0.25 delay:0 options:UIViewKeyframeAnimationOptionAllowUserInteraction animations:^{
            self.locationView.frame = CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.frame.size.height, self.locationView.bounds.size.width, self.locationView.bounds.size.height);
        }completion:^(BOOL finished){
            
            self.locationButton.image = [UIImage imageNamed:@"locationHighlightedIcon"];
            
        }];

    }
}

-(void)showProfile {
    [self performSegueWithIdentifier:@"toProfile" sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
