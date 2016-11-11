//
//  AlbumDetailsViewController.m
//  gMusic
//
//  Created by Gajaharan Satkunanandan on 07/11/2016.
//  Copyright © 2016 Gajaharan Satkunanandan. All rights reserved.
//

#import "AlbumDetailsViewController.h"
#import "MusicStoreService.h"

@interface AlbumDetailsViewController ()
@property (nonatomic, strong) UIPopoverController *masterPopoverController;
@end

@implementation AlbumDetailsViewController 
@synthesize albumImageView = _albumImageView;
@synthesize albumNameLabel = _albumNameLabel;
@synthesize artistNameLabel = _artistNameLabel;
@synthesize genreLabel = _genreLabel;
@synthesize priceLabel = _priceLabel;
@synthesize dateLabel = _dateLabel;
@synthesize saveToListButton = _saveToListButton;
@synthesize openInITunesButton = _openInITunesButton;
@synthesize masterPopoverController = _masterPopoverController;

@synthesize album = _album;
@synthesize saveToListEnabled = _saveToListEnabled;

- (void)configureView {
    // Do any additional setup after loading the view.
    
    if (!self.album.albumImage) {
        MusicStoreService *service = [[MusicStoreService alloc] init];
        [service fetchArtworkForAlbum:self.album completionBlock:^(id result, NSError *error) {
            self.album.albumImage = result;
            self.albumImageView.image = result;
        }];
    } else {
        self.albumImageView.image = self.album.albumImage;
    }
    
    self.albumNameLabel.text = self.album.albumName;
    self.artistNameLabel.text = self.album.artist.artistName;
    self.genreLabel.text = self.album.genre;
    self.priceLabel.text = [NSString stringWithFormat:@"$%@", self.album.price];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    self.dateLabel.text = [formatter stringFromDate:self.album.releaseDate];
    
    self.saveToListButton.enabled = self.saveToListEnabled;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setAlbum:(Album *)album {
    _album = album;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [self configureView];
    }
}

- (IBAction)saveToList:(id)sender {
    [self.album saveAlbum];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)openInITunes:(id)sender {
    NSURL *url = [NSURL URLWithString:self.album.iTunesURLString];
    [[UIApplication sharedApplication] openURL:url];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation {
    return NO;
}

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController {
    barButtonItem.title = @"gMusic List";
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
