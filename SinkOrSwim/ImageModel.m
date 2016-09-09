//
//  ImageModel.m
//  SinkOrSwim
//
//  Created by ch484-mac6 on 9/8/16.
//  Copyright (c) 2016 Jacob Adkins. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel


//api request format gotten from:
//https://dev.cognitive.microsoft.com/docs/services/56b43f0ccf5ff8098cef3808/operations/571fab09dbe2d933e891028f
-(NSMutableArray*) images {
    if(!_images) {
        
        _images = [[NSMutableArray alloc] init];
        NSString* path = @"https://api.cognitive.microsoft.com/bing/v5.0/images/search?entities=true&q=craig+federighi&count=10&offset=0&mkt=en-us&safeSearch=Strict";
        NSString* responseString = [self makeRestAPICall:path];
        NSArray *jsonObject = [NSJSONSerialization JSONObjectWithData:[responseString dataUsingEncoding:NSUTF8StringEncoding]
                                                              options:0 error:NULL];
        NSArray* resultsArray = [jsonObject valueForKey:@"value"];
        NSMutableArray* contentArray = [[NSMutableArray alloc] init];
        //get urls of pictures from json
        for(int i = 0; i < resultsArray.count; i++) {
            NSString* singleResult = [resultsArray[i] valueForKey:@"contentUrl"];
            [contentArray addObject:singleResult];
        }
        for(int i = 0; i < contentArray.count; i++) {
            NSURL *url = [NSURL URLWithString:contentArray[i]];
            NSData *data = [NSData dataWithContentsOfURL:url];
            UIImage *img = [[UIImage alloc] initWithData:data];
            [_images addObject:img];
        }
        
    }
    return _images;
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
//api call code taken from:
//http://rajneesh071.blogspot.com/2013/07/how-to-make-rest-api-call-in-objective-c.html
-(NSString*) makeRestAPICall : (NSString*) reqURLStr
{
    NSMutableURLRequest* _request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:reqURLStr]];
    [_request setHTTPMethod:@"POST"];
    // Request headers
    [_request setValue:@"multipart/form-data" forHTTPHeaderField:@"Content-Type"];
    [_request setValue:@"c734ea68ed1049899d482990958130f2" forHTTPHeaderField:@"Ocp-Apim-Subscription-Key"];
    // Request body
    [_request setHTTPBody:[@"{body}" dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLResponse *resp = nil;
    NSError *error = nil;
    NSData *response = [NSURLConnection sendSynchronousRequest: _request returningResponse: &resp error: &error];
    NSString *responseString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    return responseString;
}

@end



