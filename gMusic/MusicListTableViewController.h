//
//  MusicListTableViewController.h
//  gMusic
//
//  Created by Gajaharan Satkunanandan on 07/11/2016.
//  Copyright © 2016 Gajaharan Satkunanandan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicListTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *sortControl;

- (IBAction)sortList:(id)sender;

@end
