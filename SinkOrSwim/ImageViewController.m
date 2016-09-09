//
//  ImageViewController.m
//  SinkOrSwim
//
//  Created by ch484-mac6 on 9/8/16.
//  Copyright (c) 2016 Jacob Adkins. All rights reserved.
//

#import "ImageViewController.h"
#import "ImageModel.h"

@interface ImageViewController() <UIScrollViewDelegate>
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
        _imageView = [[UIImageView alloc] initWithImage: _image];
    return _imageView;
}

-(void) viewDidLoad {
    [super viewDidLoad];
    
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = self.imageView.image.size;
    self.scrollView.minimumZoomScale = .1;
    self.scrollView.delegate = self;
}
-(UIView*) viewForZoomingInScrollView:(UIScrollView*) scrollView{
    return self.imageView;
}
@end
