//
//  SearchArtistsViewController.m
//  gMusic
//
//  Created by Gajaharan Satkunanandan on 02/11/2016.
//  Copyright © 2016 Gajaharan Satkunanandan. All rights reserved.
//

#import "SearchArtistsViewController.h"
#import "Artist.h"
#import "BrowseAlbumsViewController.h"
#import "MusicStoreService.h"

@interface SearchArtistsViewController ()
@property (nonatomic, strong) NSMutableArray *artists;
@property (nonatomic, strong) MusicStoreService *service;
@end

@implementation SearchArtistsViewController

@synthesize searchBar = _searchBar;
@synthesize artists = _artists;

- (void)viewDidLoad {
	[super viewDidLoad];
	self.artists = [NSMutableArray array];
    self.service = [[MusicStoreService alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.navigationController setHidesBottomBarWhenPushed:NO];
}

- (IBAction)closeDialog:(id)sender {
	[self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
	self.searchBar.text = @"";
	[self.searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	[self.searchBar resignFirstResponder];
	//[self.artists addObject:[Artist artistWithID:47123955 name:@"Trivium"]];
	//[self.tableView reloadData];
    
    [self.service findArtistsByArtistName:searchBar.text completionBlock:^(id result, NSError *error) {
        if (error) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Search Error"
                                                                message:@"Unable to retrieve search results."
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
            [alertView show];
            return;
        }
        // Set Artists and refresh result list
        self.artists = result;
        [self.tableView reloadData];
	}];
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"artistCell"];

	Artist *artist = [self.artists objectAtIndex:indexPath.row];
	cell.textLabel.text = artist.artistName;

	return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"browseAlbums"]) {
		BrowseAlbumsViewController *controller = [segue destinationViewController];
		NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		controller.artist = [self.artists objectAtIndex:indexPath.row];
	}
}

@end
