//
//  ViewController.m
//  SinkOrSwim
//
//  Created by Jacob Adkins on 9/6/16.
//  Copyright © 2016 Jacob Adkins. All rights reserved.
//

#import "ViewController.h"
#import "TwitterViewController.h"
#import "RecipeTableViewController.h"
#import "ImagesCollectionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TwitterButton:(UIButton *)sender {
    [self performSegueWithIdentifier:@"TwitterSegue" sender:self];
}

- (IBAction)RecipeButton:(UIButton *)sender {
    [self performSegueWithIdentifier:@"RecipeSegue" sender:self];
}

- (IBAction)ImagesButton:(UIButton *)sender {
    [self performSegueWithIdentifier:@"ImagesSegue" sender:self];
}

@end
