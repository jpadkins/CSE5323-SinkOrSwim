//
//  RecipeViewController.m
//  SinkOrSwim
//
//  Created by Omar Roa on 9/9/16.
//  Copyright © 2016 Jacob Adkins. All rights reserved.
//

#import "RecipeViewController.h"

@interface RecipeViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation RecipeViewController
//
//-(UITextView*) textView{
//    if(!_textView){
//CGRect textViewFrame = CGRectMake(20.0f, 20.0f, 280.0f, 290.0f);
//_textView = [[UITextView alloc] initWithFrame:textViewFrame];
//    }
//return _textView;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    CGRect textViewFrame = CGRectMake(20.0f, 20.0f, 280.0f, 290.0f);
//    UITextView *textView = [[UITextView alloc] initWithFrame:textViewFrame];
    CGRect textViewFrame = CGRectMake(20.0f, 20.0f, 280.0f, 290.0f);
    UITextView *textView = [[UITextView alloc] initWithFrame:textViewFrame];
    textView.returnKeyType = UIReturnKeyDone;
    textView.editable = NO;
    if([_recipeType isEqualToString: @"Lemonady"])
    {
        [textView setText:@"Federighi Lemonady Freshy N Squeezy\n\nIngredients\n\n2 cups sugar\n1 cup hot water\n2 cups fresh lemon juice\n1 gallon cold water\n1 lemon, sliced\nMint sprigs, for garnish\n\nInstructions\n\nIn a 1 gallon container, place sugar and hot water,\nand stir until sugar dissolves.\nAdd lemon juice and cold water to render 1 gallon. Stir until well mixed.\nPour lemonade over glasses of ice, squeeze slice of lemon on top of each,\nand garnish with a sprig of mint.\n"];
    }
    else if([_recipeType isEqualToString: @"Mac N Cheezi"])
    {
        [textView setText:@"Federighi Mac N Cheezi\n\nCook macaroni according to the package directions. Drain.\n\nIn a saucepan, melt butter or margarine over medium heat. Stir in enough flour to make a roux. Add milk to roux slowly, stirring constantly. Stir in cheeses, and cook over low heat until cheese is melted and the sauce is a little thick. Put macaroni in large casserole dish, and pour sauce over macaroni. Stir well.\n\nMelt butter or margarine in a skillet over medium heat. Add breadcrumbs and brown. Spread over the macaroni and cheese to cover. Sprinkle with a little paprika.\n\nBake at 350 degrees F (175 degrees C) for 30 minutes. Serve."];
    }
    else
    {
        [textView setText:@"Federighi Hot Linguini\n\nIngredients\n\n1 (9-ounce) package fresh linguine\n1/2 pound extra-lean ground beef\n1/2 cup prechopped onion\n1 tablespoon minced fresh garlic\n1 teaspoon dried oregano\n1/4 teaspoon salt\n3 tablespoons tomato paste\n1 (14.5-ounce) can diced tomatoes, undrained\n1/4 cup (1 ounce) shaved Parmigiano-Reggiano cheese\n1 tablespoon fresh flat-leaf parsley leaves\n\nInstructions\n\n1. Cook pasta according to package directions, omitting salt and fat. Drain.\n\n2. While pasta cooks, heat a large skillet over medium-high heat.\n\nAdd beef, onion, garlic, oregano, and salt;\ncook 5 minutes or until beef is browned, stirring to crumble.\nStir in tomato paste; cook 1 minute, stirring frequently.\nAdd tomatoes. Bring to a boil; cook 1 minute.\nReduce heat to medium-low; cook 3 minutes or until thickened.\nServe over pasta; top with cheese and parsley."];
    }
    
    textView.delegate = self;
    [self.view addSubview:textView];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

@end
