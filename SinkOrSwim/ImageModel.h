//
//  ImageModel.h
//  SinkOrSwim
//
//  Created by ch484-mac6 on 9/8/16.
//  Copyright (c) 2016 Jacob Adkins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageModel : NSObject

@property(strong, nonatomic) NSArray* imageNames;

-(UIImage*)getImageWithName:(NSString*) name;

@end
