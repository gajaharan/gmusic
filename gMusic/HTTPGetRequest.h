//
//  HTTPGetRequest.h
//  gMusic
//
//  Created by Gajaharan Satkunanandan on 07/11/2016.
//  Copyright © 2016 Gajaharan Satkunanandan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(NSData *response);
typedef void(^FailureBlock)(NSError *error);

@interface HTTPGetRequest : NSObject

- (id)initWithURL:(NSURL *)requestURL successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;
- (void)startRequest;

@end
