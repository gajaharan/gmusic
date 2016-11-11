//
//  MainViewController.h
//  gMusic
//
//  Created by Gajaharan Satkunanandan on 02/11/2016.
//  Copyright © 2016 Gajaharan Satkunanandan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

/*- (IBAction)showAbout:(id)sender;
- (IBAction)viewList:(id)sender;*/

@property (weak, nonatomic) IBOutlet UIImageView *logoView;
@property (weak, nonatomic) IBOutlet UIButton *viewListButton;
@property (weak, nonatomic) IBOutlet UIButton *aboutButton;

@end
