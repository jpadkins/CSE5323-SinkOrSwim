//
//  ImageViewController.m
//  SinkOrSwim
//
//  Created by ch484-mac6 on 9/8/16.
//  Copyright (c) 2016 Jacob Adkins. All rights reserved.
//

#import "ImageViewController.h"
#import "ImageModel.h"

@interface ImageViewController()
@property (strong, nonatomic) UIImageView* imageView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property(strong, nonatomic) ImageModel *imageModel;
@end

@implementation ImageViewController
-(ImageModel*) imageModel {
    if(!_imageModel)
        _imageModel = [ImageModel sharedInstance];
    return _imageModel;
}

-(UIImageView*) imageView{
    
    if(!_imageView)
        _imageView = [[UIImageView alloc]initWithImage:[[ImageModel sharedInstance] getImageWithName:@"craig1" ]];
    return _imageView;
}

-(void) viewDidLoad {
    [super viewDidLoad];
    
    [self.scrollView addSubview:self.imageView];
}
@end
