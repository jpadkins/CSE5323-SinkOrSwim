//
//  LinguiniRecipeViewController.m
//  SinkOrSwim
//
//  Created by Omar Roa on 9/9/16.
//  Copyright © 2016 Jacob Adkins. All rights reserved.
//

#import "LinguiniRecipeViewController.h"

@interface LinguiniRecipeViewController () <UITextViewDelegate>

@end

@implementation LinguiniRecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect textViewFrame = CGRectMake(20.0f, 20.0f, 280.0f, 290.0f);
    UITextView *textView = [[UITextView alloc] initWithFrame:textViewFrame];
    textView.returnKeyType = UIReturnKeyDone;
    [textView setText:@"Federighi Hot Linguini\n\nIngredients\n\n1 (9-ounce) package fresh linguine\n1/2 pound extra-lean ground beef\n1/2 cup prechopped onion\n1 tablespoon minced fresh garlic\n1 teaspoon dried oregano\n1/4 teaspoon salt\n3 tablespoons tomato paste\n1 (14.5-ounce) can diced tomatoes, undrained\n1/4 cup (1 ounce) shaved Parmigiano-Reggiano cheese\n1 tablespoon fresh flat-leaf parsley leaves\n\nInstructions\n\n1. Cook pasta according to package directions, omitting salt and fat. Drain.\n\n2. While pasta cooks, heat a large skillet over medium-high heat.\n\nAdd beef, onion, garlic, oregano, and salt;\ncook 5 minutes or until beef is browned, stirring to crumble.\nStir in tomato paste; cook 1 minute, stirring frequently.\nAdd tomatoes. Bring to a boil; cook 1 minute.\nReduce heat to medium-low; cook 3 minutes or until thickened.\nServe over pasta; top with cheese and parsley."];
    textView.delegate = self;
    [self.view addSubview:textView];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
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