//
//  MacNCheeseRecipeViewController.m
//  SinkOrSwim
//
//  Created by Omar Roa on 9/9/16.
//  Copyright © 2016 Jacob Adkins. All rights reserved.
//

#import "MacNCheeseRecipeViewController.h"

@interface MacNCheeseRecipeViewController () <UITextViewDelegate>

@end

@implementation MacNCheeseRecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect textViewFrame = CGRectMake(20.0f, 20.0f, 280.0f, 290.0f);
    UITextView *textView = [[UITextView alloc] initWithFrame:textViewFrame];
    textView.returnKeyType = UIReturnKeyDone;
    [textView setText:@"Federighi Mac N Cheezi\n\nCook macaroni according to the package directions. Drain.\n\nIn a saucepan, melt butter or margarine over medium heat. Stir in enough flour to make a roux. Add milk to roux slowly, stirring constantly. Stir in cheeses, and cook over low heat until cheese is melted and the sauce is a little thick. Put macaroni in large casserole dish, and pour sauce over macaroni. Stir well.\n\nMelt butter or margarine in a skillet over medium heat. Add breadcrumbs and brown. Spread over the macaroni and cheese to cover. Sprinkle with a little paprika.\n\nBake at 350 degrees F (175 degrees C) for 30 minutes. Serve."];
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