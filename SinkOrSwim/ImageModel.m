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
    
    
//    NSString* path = @"https://api.cognitive.microsoft.com/bing/v5.0/images/search";
//    NSArray* parameterList = @[
//                               // Request parameters
//                               @"entities=true",
//                               @"q=craig federighi",
//                               @"count=20",
//                               @"offset=0",
//                               @"mkt=en-us",
//                               @"safeSearch=Strict",
//                               ];
//    
//    NSString* string = [parameterList componentsJoinedByString:@"&"];
//    path = [path stringByAppendingFormat:@"?%@", string];
//    
//    NSLog(@"%@", path);
//    
//    NSMutableURLRequest* _request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
//    [_request setHTTPMethod:@"GET"];
//    // Request headers
//    [_request setValue:@"c734ea68ed1049899d482990958130f2" forHTTPHeaderField:@"Ocp-Apim-Subscription-Key"];
//    // Request body
//    [_request setHTTPBody:[@"{body}" dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    NSURLResponse *response = nil;
//    NSError *error = nil;
//    NSData* _connectionData = [NSURLConnection sendSynchronousRequest:_request returningResponse:&response error:&error];
//    
//    if (nil != error)
//    {
//        NSLog(@"Error: %@", error);
//    }
//    else
//    {
//        NSError* error = nil;
//        NSMutableDictionary* json = nil;
//        NSString* dataString = [[NSString alloc] initWithData:_connectionData encoding:NSUTF8StringEncoding];
//        NSLog(@"%@", dataString);
//        
//        if (nil != _connectionData)
//        {
//            json = [NSJSONSerialization JSONObjectWithData:_connectionData options:NSJSONReadingMutableContainers error:&error];
//        }
//        
//        if (error || !json)
//        {
//            NSLog(@"Could not parse loaded json with error:%@", error);
//        }
//        
//        NSLog(@"%@", json);
//        _connectionData = nil;
//    }
    

}

+(ImageModel*) sharedInstance{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[ImageModel alloc]init];
    });
    return _sharedInstance;
    
}
-(UIImage*) getImageWithName:(NSString *)name {
    
    UIImage* image = nil;
    image = [UIImage imageNamed:name];
    return image;
}
@end



