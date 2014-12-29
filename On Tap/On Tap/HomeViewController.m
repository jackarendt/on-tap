//
//  HomeViewController.m
//  On Tap
//
//  Created by Jack Arendt on 12/23/14.
//  Copyright (c) 2014 John Arendt. All rights reserved.
//

#import "HomeViewController.h"
#import "BarTableViewCell.h"


@interface HomeViewController (){
    BOOL locationVisible;
}
@property (nonatomic, strong) LocationView *locationView;
@property (nonatomic, strong) UIBarButtonItem *locationButton;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Initialize locationVisible view to not be visible
    locationVisible = NO;
    
    self.navigationItem.title = @"On Tap";
    
    //Create locationButton, needs to be property because the image changes when locationView active
    self.locationButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"locationIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(showLocationPreferences)];
    self.navigationItem.rightBarButtonItem = self.locationButton;
    
    //Create profile button
    UIBarButtonItem *profileButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"profileIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(showProfile)];
    self.navigationItem.leftBarButtonItem = profileButton;
    
    //create locationView and add it to main view
    self.locationView = [[LocationView alloc] initWithFrame:CGRectMake(0, -90, self.view.bounds.size.width, 90)];
    
    [self.view addSubview:self.locationView];
    [self.locationView setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** Changes whether to show the locationview or not.
 ** Dependent on the locationVisible boolean
 **/
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

//Segues to main Profile View Controller
-(void)showProfile {
    [self performSegueWithIdentifier:@"toProfile" sender:self];
}


/**
 ** LocationViewDelegate Methods
 **/
-(void)locationValuesDidChange:(BOOL)location facebookVisible:(BOOL)visible {
    //handle it in user prefs
}


#pragma mark - TableView delegate and data source methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8; //needs to be changed to add kam's
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Need to add kam's
    NSArray *names = @[@"brothers", @"clybourne", @"firehaus", @"joe's", @"legends", @"murphy's", @"red lion", @"white horse"];
    NSArray *images = @[@"brothers", @"clybourne", @"firehaus", @"joes", @"legends", @"murphys", @"redlion", @"whitehorse"];
    
    //Create cell
    BarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.barImageString = images[indexPath.row];
    cell.name = names[indexPath.row];
    [cell createView:(float)indexPath.row/8];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
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
