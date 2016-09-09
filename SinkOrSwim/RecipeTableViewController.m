//
//  RecipeTableViewController.m
//  SinkOrSwim
//
//  Created by Jacob Adkins on 9/6/16.
//  Copyright © 2016 Jacob Adkins. All rights reserved.
//

#import "RecipeTableViewController.h"

@interface RecipeTableViewController ()


@end

@implementation RecipeTableViewController

NSArray *recipes;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    recipes = [NSArray arrayWithObjects:@"Mac N Cheezi", @"Hot Linguini", @"Lemonady Fresh N Squeezy", nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [recipes count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    
    NSString *recipeName = [recipes objectAtIndex:indexPath.row];
    cell.textLabel.text = recipeName;
    cell.imageView.image = [UIImage imageNamed: recipeName];
    
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end


//NSArray *pastas;
//NSArray *drinks;
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    // Uncomment the following line to preserve selection between presentations.
//    // self.clearsSelectionOnViewWillAppear = NO;
//    
//    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    drinks = [NSArray arrayWithObjects:@"Lemonady Fresh N Squeezy", nil];
//    pastas = [NSArray arrayWithObjects:@"Mac N Cheezi", @"Hot Linguini", nil];
//}
//
//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//-(NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
//{ if(segment.selectedSegmentIndex==0)
//{
//    return [pastas count];
//}
//else
//    if (segment.selectedSegmentIndex==1) {
//        return[drinks count];
//
//    }
//
//    return 0;
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
//
//    if(segment.selectedSegmentIndex==0)
//    {
//
//        NSString *recipeName = [pastas objectAtIndex:indexPath.row];
//        cell.textLabel.text = recipeName;
//        cell.imageView.image = [UIImage imageNamed: recipeName];    }
//    else if (segment.selectedSegmentIndex==1) {
//            NSString *recipeName = [drinks objectAtIndex:indexPath.row];
//            cell.textLabel.text = recipeName;
//            cell.imageView.image = [UIImage imageNamed: recipeName];
//        }
//
//
//
//    return cell;
//}
