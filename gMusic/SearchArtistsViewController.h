//
//  SearchArtistsViewController.h
//  gMusic
//
//  Created by Gajaharan Satkunanandan on 02/11/2016.
//  Copyright © 2016 Gajaharan Satkunanandan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchArtistsViewController : UITableViewController <UISearchBarDelegate>

@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;

- (IBAction)closeDialog:(id)sender;

@end
