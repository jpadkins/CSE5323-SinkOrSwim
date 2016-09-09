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

#include <stdlib.h>

@interface ViewController ()

@property (nonatomic) bool do_intense;
@property (nonatomic) float intensity;
@property (weak, nonatomic) IBOutlet UIButton *FederighiFace;
@property (weak, nonatomic) IBOutlet UIButton *FederighiTwitterButton;
@property (weak, nonatomic) IBOutlet UIButton *FederighiRecipeButton;
@property (weak, nonatomic) IBOutlet UIButton *FederighiPicturesButton;
@property (nonatomic) CGRect faceRect, twitterRect, recipeRect, picturesRect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    // start the intensity timer
    [NSTimer scheduledTimerWithTimeInterval:0.01
                                     target:self
                                   selector:@selector(getIntense:)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Setters & Getters

- (bool)do_intense {
    if (!_do_intense) {
        _do_intense = NO;
    }
    return _do_intense;
}

- (float)intensity {
    if (!_intensity) {
        _intensity = 0.0;
    }
    return _intensity;
}

// Methods

- (void)getIntense:(NSTimer*)t {
    if (self.do_intense) {
        [UIView performWithoutAnimation:^{
            CGRect frame;
            int intensityValue = (self.intensity*100);
            
            frame = self.twitterRect;
            frame.origin.x += -intensityValue + (rand() % (intensityValue*2 + 1));
            frame.origin.y += -intensityValue + (rand() % (intensityValue*2 + 1));
            [self.FederighiTwitterButton.layer setFrame:frame];
            
            frame = self.recipeRect;
            frame.origin.x += -intensityValue + (rand() % (intensityValue*2 + 1));
            frame.origin.y += -intensityValue + (rand() % (intensityValue*2 + 1));
            [self.FederighiRecipeButton.layer setFrame:frame];
            
            frame = self.picturesRect;
            frame.origin.x += -intensityValue + (rand() % (intensityValue*2 + 1));
            frame.origin.y += -intensityValue + (rand() % (intensityValue*2 + 1));
            [self.FederighiPicturesButton.layer setFrame:frame];
        }];
    }
}

// Events

- (IBAction)IntenseSlider:(UISlider *)sender {
    self.intensity = sender.value;
    NSLog(@"The value is %f", self.intensity);
}

- (IBAction)IntenseSwitch:(UISwitch *)sender {
    self.do_intense = sender.isOn;
    if (sender.isOn) {
        // set default rect location values
        self.twitterRect = self.FederighiTwitterButton.frame;
        self.recipeRect = self.FederighiRecipeButton.frame;
        self.picturesRect = self.FederighiPicturesButton.frame;
    } else {
        self.FederighiTwitterButton.frame = self.twitterRect;
        self.FederighiRecipeButton.frame = self.recipeRect;
        self.FederighiPicturesButton.frame = self.picturesRect;
    }
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
