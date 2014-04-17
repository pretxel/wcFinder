//
//  ESMClientWC.m
//  wcFinder
//
//  Created by Edsel Serrano on 16/04/14.
//  Copyright (c) 2014 Edsel Serrano. All rights reserved.
//

#import "ESMClientWC.h"

@implementation ESMClientWC

#pragma mark - Singleton


+(instancetype)client
{
    static ESMClientWC * requests = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        requests = [[ESMClientWC alloc] initWithBaseURL:[NSURL URLWithString:@"http://download.finance.yahoo.com/d/quotes.csv"]];
    });
    return requests;
}


#pragma mark - custom initialization

-(id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self)
    {
        [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
        [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
        
    }
    
    return self;
}

#pragma mark - Custom fetching functions

-(void)sendPosicion:(NSDictionary *)params {
    [self POST:@"WC" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"PETICION EXITOSA");
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"ERROR: %@", error);
    }];
}

@end
