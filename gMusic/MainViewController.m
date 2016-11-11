//
//  MainViewController.m
//  gMusic
//
//  Created by Gajaharan Satkunanandan on 02/11/2016.
//  Copyright © 2016 Gajaharan Satkunanandan. All rights reserved.
//

#import "MainViewController.h"
#import "AboutViewController.h"
#import "MusicListTableViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"gMusic";
    UIImage *logoImage = [UIImage imageNamed:@"logo.jpg"];
    self.logoView.image = logoImage;
    
    /*UIImage *bgImage = [UIImage imageNamed:@"background"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];
    
    self.viewListButton.backgroundColor = [UIColor clearColor];
    self.aboutButton.backgroundColor = [UIColor clearColor];
    UIEdgeInsets insets = UIEdgeInsetsMake(12.0f, 12.0f, 12.0f, 12.0f);
    UIImage *buttonImage = [[UIImage imageNamed:@"buttonbg"] resizableImageWithCapInsets:insets];
    [self.viewListButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [self.aboutButton setBackgroundImage:buttonImage forState:UIControlStateNormal];*/
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/*- (IBAction)showAbout:(id)sender {
    id controller = [[AboutViewController alloc] initWithNibName:@"AboutView" bundle:nil];
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (IBAction)viewList:(id)sender {
    id controller = [[MusicListTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:controller animated:YES];
}*/

@end
