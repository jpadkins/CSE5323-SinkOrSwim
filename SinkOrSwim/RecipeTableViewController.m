//
//  RecipeTableViewController.m
//  SinkOrSwim
//
//  Created by Jacob Adkins on 9/6/16.
//  Copyright © 2016 Jacob Adkins. All rights reserved.
//

#import "RecipeTableViewController.h"

@interface RecipeTableViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation RecipeTableViewController

//NSArray *recipes;
//
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    recipes = [NSArray arrayWithObjects:@"Mac N Cheezi", @"Hot Linguini", @"Lemonady", nil];
//}
//
//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return [recipes count];
//
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *simpleTableIdentifier = @"SimpleTableCell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
//    }
//    
//    
//    NSString *recipeName = [recipes objectAtIndex:indexPath.row];
//    cell.textLabel.text = recipeName;
//    cell.imageView.image = [UIImage imageNamed: recipeName];
//    
//    return cell;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if(indexPath.row == 0){
//    [self performSegueWithIdentifier:@"MacNCheeziSegue" sender:self];
//    }
//    else if(indexPath.row == 1){
//    [self performSegueWithIdentifier:@"HotLinguiniSegue" sender:self];
//    }
//    else if(indexPath.row == 2){
//    [self performSegueWithIdentifier:@"LemonadyFreshNSqueezySegue" sender:self];
//    }
//}
//- (IBAction)clickSegmentedController:(id)sender {
//    
//}


NSArray *pastas;
NSArray *drinks;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    drinks = [NSArray arrayWithObjects:@"Lemonady", nil];
    pastas = [NSArray arrayWithObjects:@"Mac N Cheezi", @"Hot Linguini", nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section{
    if(_segmentedControl.selectedSegmentIndex==0)
    {
        return [pastas count];
    }
    else if (_segmentedControl.selectedSegmentIndex==1)
    {
        return[drinks count];
    }
    return 0;
}

-(IBAction) clickSegmentedController: (id)sender
{
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            _segmentedControl.selectedSegmentIndex=0;
              [self.tableView reloadData];
            break;
        case 1:
            _segmentedControl.selectedSegmentIndex=1;
              [self.tableView reloadData];
        default:
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }

    if(_segmentedControl.selectedSegmentIndex==0)
    {

        NSString *recipeName = [pastas objectAtIndex:indexPath.row];
        cell.textLabel.text = recipeName;
        cell.imageView.image = [UIImage imageNamed: recipeName];    }
    else if (_segmentedControl.selectedSegmentIndex==1) {
            NSString *recipeName = [drinks objectAtIndex:indexPath.row];
            cell.textLabel.text = recipeName;
            cell.imageView.image = [UIImage imageNamed: recipeName];
        }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
    [self performSegueWithIdentifier:@"MacNCheeziSegue" sender:self];
    }
    else if(indexPath.row == 1){
    [self performSegueWithIdentifier:@"HotLinguiniSegue" sender:self];
    }
    else if(indexPath.row == 2){
    [self performSegueWithIdentifier:@"LemonadyFreshNSqueezySegue" sender:self];
    }
}

@end

