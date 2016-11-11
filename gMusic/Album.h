//
//  Album.h
//  gMusic
//
//  Created by Gajaharan Satkunanandan on 07/11/2016.
//  Copyright © 2016 Gajaharan Satkunanandan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Artist.h"

@interface Album : NSObject

@property (nonatomic, assign) NSUInteger albumID;
@property (nonatomic, copy) NSString *albumName;
@property (nonatomic, copy) NSString *imageURLString;
@property (nonatomic, strong) UIImage *albumImage;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *iTunesURLString;
@property (nonatomic, strong) NSDate *releaseDate;
@property (nonatomic, copy) NSString *genre;
@property (nonatomic, strong) Artist *artist;

+ (NSArray *)findAllAlbums;
- (BOOL)saveAlbum;
- (BOOL)deleteAlbum;

@end
