//
//  ESMClientWC.h
//  wcFinder
//
//  Created by Edsel Serrano on 16/04/14.
//  Copyright (c) 2014 Edsel Serrano. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface ESMClientWC : AFHTTPSessionManager

+(instancetype)client;
-(void)sendPosicion:(NSDictionary *)params;

@end
