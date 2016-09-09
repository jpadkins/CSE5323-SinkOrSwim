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
@property (nonatomic) bool faceAlternate;
@property (nonatomic) int faceClickCount;
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
    
    // set the background
    
    // start the timers
    [NSTimer scheduledTimerWithTimeInterval:0.01
                                     target:self
                                   selector:@selector(getIntense:)
                                   userInfo:nil
                                    repeats:YES];
    
    CGRect frame = self.FederighiFace.frame;
    frame.origin.x -= 50;
    frame.origin.y -= 50;
    [self.FederighiFace setFrame:frame];
    self.faceRect = self.FederighiFace.frame;
    
    [NSTimer scheduledTimerWithTimeInterval:0.005
                                     target:self
                                   selector:@selector(faceShift:)
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

- (int)faceClickCount {
    if (!_faceClickCount) {
        _faceClickCount = 0;
    }
    return _faceClickCount;
}

// Methods

- (void)getIntense:(NSTimer*)t {
    if (self.do_intense) {
        [UIView performWithoutAnimation:^{
            CGRect frame;
            int intensityValue = (self.intensity*100)/4;
            
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

- (void)faceShift:(NSTimer*)t {
    [UIView performWithoutAnimation:^{
        CGRect frame = self.FederighiFace.frame;
        if (self.faceAlternate) {
            frame.origin.x += 1;
            frame.origin.y += 1;
            [self.FederighiFace.layer setFrame:frame];
            if (frame.origin.x > self.faceRect.origin.x + 70) { self.faceAlternate = NO; }
        } else {
            frame.origin.x -= 1;
            frame.origin.y -= 1;
            [self.FederighiFace.layer setFrame:frame];
            if (frame.origin.x < self.faceRect.origin.x - 500) {
                self.faceClickCount = 0;
                self.faceAlternate = YES;
            }
        }
    }];
}

// Events

- (IBAction)IntenseSlider:(UISlider *)sender {
    self.intensity = sender.value;
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
}

- (IBAction)RecipeButton:(UIButton *)sender {
}

- (IBAction)ImagesButton:(UIButton *)sender {
}

- (IBAction)FaceClick:(UIButton *)sender {
    self.faceClickCount += 1;
    if (self.faceClickCount > 2) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Secret Message Modal"
                                                                      message:@"You're a fast clicker!"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertDelegate = [UIAlertAction actionWithTitle:@"👍💯💯💯💯"
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction *action) {
                                                                  [alert dismissViewControllerAnimated:YES
                                                                                            completion:nil];
                                                              }];
        [alert addAction:alertDelegate];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
