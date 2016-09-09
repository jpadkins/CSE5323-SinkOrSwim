//
//  LemonadeRecipe.m
//  SinkOrSwim
//
//  Created by Omar Roa on 9/9/16.
//  Copyright © 2016 Jacob Adkins. All rights reserved.
//

#import "LemonadeRecipe.h"

@interface LemonadeRecipe () <UITextViewDelegate>

@end

@implementation LemonadeRecipe

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect textViewFrame = CGRectMake(20.0f, 20.0f, 280.0f, 290.0f);
    UITextView *textView = [[UITextView alloc] initWithFrame:textViewFrame];
    textView.returnKeyType = UIReturnKeyDone;
    [textView setText:@"Federighi Lemonady Freshy N Squeezy\n\nIngredients\n\n2 cups sugar\n1 cup hot water\n2 cups fresh lemon juice\n1 gallon cold water\n1 lemon, sliced\nMint sprigs, for garnish\n\nInstructions\n\nIn a 1 gallon container, place sugar and hot water,\nand stir until sugar dissolves.\nAdd lemon juice and cold water to render 1 gallon. Stir until well mixed.\nPour lemonade over glasses of ice, squeeze slice of lemon on top of each,\nand garnish with a sprig of mint.\n"];
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
