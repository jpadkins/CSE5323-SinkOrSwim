//
//  ImageModel.m
//  SinkOrSwim
//
//  Created by ch484-mac6 on 9/8/16.
//  Copyright (c) 2016 Jacob Adkins. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel
@synthesize imageNames = _imageNames;

-(NSArray*)imageNames{
                       
    if(!_imageNames)
        _imageNames = @[@"craig1", @"craig2", @"craig3"];
    return _imageNames;
}

-(UIImage*) getImageWithName:(NSString *)name {
    
    UIImage* image = nil;
    image = [UIImage imageNamed:name];
    return image;
}
@end
