//
//  Artist.h
//  gMusic
//
//  Created by Gajaharan Satkunanandan on 07/11/2016.
//  Copyright © 2016 Gajaharan Satkunanandan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject <NSCoding> 

@property (nonatomic, assign) NSUInteger artistID;
@property (nonatomic, copy) NSString *artistName;

+(id)artistWithID:(NSUInteger)artistID name:(NSString *)artistName;
-(id)initWithID:(NSUInteger)artistID name:(NSString *)artistName;

@end
