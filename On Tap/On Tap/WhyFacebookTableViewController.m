//
//  WhyFacebookTableViewController.m
//  On Tap
//
//  Created by Jack Arendt on 12/23/14.
//  Copyright (c) 2014 John Arendt. All rights reserved.
//

#import "WhyFacebookTableViewController.h"
#import "OTConstants.h"

@interface WhyFacebookTableViewController ()

@end

@implementation WhyFacebookTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *goBackButton = [[UIBarButtonItem alloc] initWithTitle:@"got it!" style:UIBarButtonItemStylePlain target:self action:@selector(returnToLoginScreen)];
    self.navigationItem.rightBarButtonItem = goBackButton;  //adds go back button
    self.navigationItem.title = @"On Tap";  //Sets navigation title
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//dismiss modal view controller
-(void)returnToLoginScreen {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Headers
    if(indexPath.row % 2 == 0) {
        NSArray *questions = @[@"why do i need to login with facebook?", @"will on tap ever post on my behalf?"];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headerCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:mainRed green:mainGreen blue:mainBlue alpha:1.0];
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, cell.bounds.size.width - 10, cell.bounds.size.height - 5)];
        headerLabel.text = questions[indexPath.row/2];
        headerLabel.numberOfLines = 2;
        headerLabel.textAlignment = NSTextAlignmentCenter;
        headerLabel.textColor = [UIColor whiteColor];
        headerLabel.font = [UIFont fontWithName: mainFont size:27.0];
        [cell addSubview:headerLabel];
        
        return cell;
    }
    //Content
    else
    {
        NSArray *answers = @[@"Facebook login is required because it helps you find where your friends are at.  On Tap will only see your friends list, your name, and your profile picture.", @"No. On tap will never post on your behalf."];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contentCell" forIndexPath:indexPath];
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, cell.bounds.size.width - 20, cell.bounds.size.height - 15)];
        textView.selectable = false;
        textView.editable = false;
        textView.font = [UIFont fontWithName:mainFont size:16.0];
        textView.text = answers[indexPath.row/2];
        
        [cell addSubview:textView];
        return cell;
    }
}

//Headers have a height of 100pt while content has a height of 150pt
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row % 2)
        return 150;
    return 100;
}

@end
