//
//  LoginViewController.m
//  On Tap
//
//  Created by Jack Arendt on 12/23/14.
//  Copyright (c) 2014 John Arendt. All rights reserved.
//

#import "LoginViewController.h"
#import "OTConstants.h"

#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface LoginViewController (){
    BOOL sso;
}
@property (nonatomic, strong) UILabel *logoLabel;
@property (nonatomic, strong) UIButton *learnMoreButton;
@property (nonatomic, strong) UIButton *loginButton;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    sso = NO;
    UIColor *blue = [UIColor colorWithRed:mainRed green:mainGreen blue:mainBlue alpha:1.0]; //main color
    
    //Set up logo label and add it to view
    self.logoLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 120, self.view.bounds.size.width - 20, 100)];
    self.logoLabel.text = @"On Tap";
    self.logoLabel.font = [UIFont fontWithName:mainFont size:80];
    self.logoLabel.textAlignment = NSTextAlignmentCenter;
    self.logoLabel.textColor = blue;
    [self.view addSubview:self.logoLabel];
    
    //Set up learn more button at bottom of view and add to view
    self.learnMoreButton = [[UIButton alloc] initWithFrame:CGRectMake(10, self.view.bounds.size.height - 25, self.view.bounds.size.width - 20, 20)];
    [self.learnMoreButton setTitle:@"why do i need to login with facebook?" forState:UIControlStateNormal];
    [self.learnMoreButton setTitleColor:blue forState:UIControlStateNormal];
    //Darken the text when highlighted
    [self.learnMoreButton setTitleColor:[UIColor colorWithRed:secondaryRed green:secondaryGreen blue:secondaryBlue alpha:1.0] forState:UIControlStateHighlighted];
    self.learnMoreButton.titleLabel.font = [UIFont fontWithName:mainFont size:15];
    //Add target to button
    [self.learnMoreButton addTarget:self action:@selector(segueToLearnMore) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.learnMoreButton];
    
    //Add horizontal separator to separate the learn more button from the rest of the view
    UIView *sep = [[UIView alloc] initWithFrame:CGRectMake(4, self.view.bounds.size.height - 28, self.view.bounds.size.width - 8, 1)];
    sep.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sep];
    
    //Create login button and add it to the view
    self.loginButton = [[UIButton alloc] initWithFrame:CGRectMake(20, self.view.bounds.size.height/2 + 30, self.view.bounds.size.width - 40, 60)];
    [self.loginButton setTitle:@"login with facebook" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //Set primary color as the main facebook blue
    [self.loginButton setBackgroundImage:[OTConstants imageWithColor:[UIColor colorWithRed:fbRed green:fbGreen blue:fbBlue alpha:1.0]] forState:UIControlStateNormal];
    //Set the highlihgted color as the lighter facebook blue
    [self.loginButton setBackgroundImage:[OTConstants imageWithColor:[UIColor colorWithRed:lightFBRed green:lightFBGreen blue:lightFBBlue alpha:1.0]] forState:UIControlStateHighlighted];
    self.loginButton.titleLabel.font = [UIFont fontWithName:mainFont size:20];
    self.loginButton.layer.cornerRadius = 5.0;
    self.loginButton.clipsToBounds = YES;
    [self.loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];
    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
        NSLog(@"User is logged in");
        sso = true;
        [self performSegueWithIdentifier:@"toMainScreen" sender:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Segues to learn more page
-(void)segueToLearnMore {
    [self performSegueWithIdentifier:@"toWhyFacebook" sender:self];
}

-(void)login {
    NSArray *permissionsArray = @[@"public_profile", @"email", @"user_friends"];
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        if (!user) {
            NSString *errorMessage = nil;
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
                errorMessage = @"Uh oh. The user cancelled the Facebook login.";
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
                errorMessage = [error localizedDescription];
            }
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error"
                                                            message:errorMessage
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"Dismiss", nil];
            [alert show];
        } else {
            if (user.isNew) {
                NSLog(@"User with facebook signed up and logged in!");
            } else {
                NSLog(@"User with facebook logged in!");
            }
            [self performSegueWithIdentifier:@"toMainScreen" sender:self];
        }
    }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}

@end
