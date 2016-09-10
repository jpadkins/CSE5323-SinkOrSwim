//
//  RecipeTableViewController.m
//  SinkOrSwim
//
//  Created by Jacob Adkins on 9/6/16.
//  Copyright © 2016 Jacob Adkins. All rights reserved.
//

#import "RecipeTableViewController.h"
#import "RecipeViewController.h"

@interface RecipeTableViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation RecipeTableViewController




NSArray *pastas;
NSArray *drinks;
NSString * type;

- (void)viewDidLoad {
    [super viewDidLoad];

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
- (IBAction)clickSegmentedController:(id)sender {
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
        type = recipeName;
        cell.textLabel.text = recipeName;
        cell.imageView.image = [UIImage imageNamed: recipeName];    }
    else if (_segmentedControl.selectedSegmentIndex==1) {
            NSString *recipeName = [drinks objectAtIndex:indexPath.row];
            type = recipeName;
            cell.textLabel.text = recipeName;
            cell.imageView.image = [UIImage imageNamed: recipeName];
        }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
    [self performSegueWithIdentifier:@"RecipeViewSegue" sender:self];
    }
    else if(indexPath.row == 1){
    [self performSegueWithIdentifier:@"RecipeViewSegue" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:selectedIndexPath];
    
    RecipeViewController *rvc = [segue destinationViewController];
    rvc.recipeType = cell.textLabel.text;
}

@end

