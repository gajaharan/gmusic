//
//  MusicListTableViewController.m
//  gMusic
//
//  Created by Gajaharan Satkunanandan on 07/11/2016.
//  Copyright © 2016 Gajaharan Satkunanandan. All rights reserved.
//

#import "MusicListTableViewController.h"
#import "Album.h"
#import "MusicListTableViewCell.h"
#import "AlbumDetailsViewController.h"

static NSString* const SortKey = @"sort";

static NSInteger const SortByName = 0;
static NSInteger const SortByDate = 1;

@interface MusicListTableViewController ()
@property (nonatomic, strong) NSMutableArray *albums;
@property (nonatomic, strong) AlbumDetailsViewController *detailViewController;
@end

@implementation MusicListTableViewController

@synthesize albums = _albums;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"gMusic List";
    self.detailViewController = (AlbumDetailsViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    self.albums = [NSMutableArray arrayWithArray:[Album findAllAlbums]];
    if (self.albums.count > 0) {
        self.detailViewController.album = [self.albums objectAtIndex:0];
    }
    
    self.sortControl.selectedSegmentIndex = [[NSUserDefaults standardUserDefaults] integerForKey:SortKey];
}

- (void)reloadData {
    self.albums = [NSMutableArray arrayWithArray:[Album findAllAlbums]];
    
    NSInteger sortBy = [[NSUserDefaults standardUserDefaults] integerForKey:SortKey];
    if(sortBy == SortByName) {
        NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"albumName" ascending:YES];
        [self.albums sortUsingDescriptors:[NSArray arrayWithObject:descriptor]];
    }
    
    [self.tableView reloadData];
}

-(void)sortList:(id)sender {
    NSInteger selectedIndex = [sender selectedSegmentIndex];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:selectedIndex forKey:SortKey];
    [userDefaults synchronize];
    [self reloadData];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadData];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.albums.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    MusicListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    /*if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }*/
    
    Album *album = [self.albums objectAtIndex:indexPath.row];
    //cell.imageView.image = album.albumImage;
    //cell.textLabel.text = album.albumName;
     
    cell.albumImageView.image = album.albumImage;
    cell.albumNameLabel.text = album.albumName;
    cell.artistNameLabel.text = album.artist.artistName;
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Album *album = [self.albums objectAtIndex:indexPath.row];
        [album deleteAlbum];
        [self.albums removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Album *album = [self.albums objectAtIndex:indexPath.row];
        AlbumDetailsViewController *controller = [segue destinationViewController];
        controller.album = album;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /*Album *album = [self.albums objectAtIndex:indexPath.row];
    NSString *message = [NSString stringWithFormat:@"Artist: %@\nAlbum: %@", album.artist.artistName, album.albumName];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Selection"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];*/
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        self.detailViewController.album = [self.albums objectAtIndex:indexPath.row];
    }
}
@end
