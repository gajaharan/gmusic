//
//  BrowseAlbumsViewController.h
//  gMusic
//
//  Created by Gajaharan Satkunanandan on 02/11/2016.
//  Copyright © 2016 Gajaharan Satkunanandan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Artist;

@interface BrowseAlbumsViewController : UITableViewController

@property (nonatomic, strong) Artist *artist;

- (IBAction)closeDialog:(id)sender;

@end
