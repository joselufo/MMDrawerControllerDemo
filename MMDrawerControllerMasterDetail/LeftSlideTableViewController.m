//
//  LeftSlideTableViewController.m
//  MMDrawerControllerMasterDetail
//
//  Created by Jose Luis Franconetti Olmedo on 15/05/14.
//  Copyright (c) 2014 Jose Luis Franconetti Olmedo. All rights reserved.
//

#import "LeftSlideTableViewController.h"

@interface LeftSlideTableViewController ()

@end

@implementation LeftSlideTableViewController

- (NSArray *) testModel {
    return @[@"Home", @"Page 1"];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[self testModel] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self testModel][indexPath.row];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"page1"];
    UIViewController *vcMain = [self.storyboard instantiateViewControllerWithIdentifier:@"vcmain"];
    
    switch (index) {
        case 0: {
            [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
                self.mm_drawerController.centerViewController = vcMain;
                [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
            }];
            break;
        }
        case 1: {
            [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
                self.mm_drawerController.centerViewController = vc;
                [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
            }];
            break;
        }
        
        default:
            break;
            
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
