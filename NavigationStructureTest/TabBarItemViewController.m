//
//  TabBarItemViewController.m
//  NavigationStructureTest
//
//  Created by matt.propst on 7/3/15.
//  Copyright (c) 2015 matt.propst. All rights reserved.
//

#import "TabBarItemViewController.h"

@interface TabBarItemViewController ()

@end

@implementation TabBarItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewDidAppear:(BOOL)animated{
    //self.navigationItem.backBarButtonItem.title = @"HOME";
    
    self.tabBarController.title = @"Entity List";
    
    
    //Pretty activity indicator
    [self.topTableView reloadData];
    
    [self.navigationController.navigationBar setHidden:NO];
    NSLog(@"VC ARRAY: %@", self.tabBarController.viewControllers);
    UINavigationController *moreViewController = self.tabBarController.moreNavigationController;
    if(moreViewController)
    {
        NSLog(@"More view controller");
        // First, get the view embedding the grandchildview to front.
        //[self bringSubviewToFront:[grandchildview superview]];
        // Now, inside that container view, get the "grandchildview" to front.
        //[[grandchildview superview] bringSubviewToFront:grandchildview];
        //[self.view bringSubViewToFront:self.tabBarController.moreNavigationController.navigationBar];
        // Possibly helpful SO posts
        // http://stackoverflow.com/questions/2777438/how-to-tell-if-uiviewcontrollers-view-is-visible
        // http://stackoverflow.com/questions/17402605/log-every-button-press-interaction-in-an-ios-app
        // http://stackoverflow.com/questions/825066/how-to-disable-the-edit-button-that-appears-in-the-more-section-of-a-uitabbarcon
        if (moreViewController.isViewLoaded && moreViewController.view.window) {
            NSLog(@"More view controller view loaded");
            
        }
        UINavigationBar *morenavbar = moreViewController.navigationBar;
        UINavigationItem *morenavitem = morenavbar.topItem;
        NSLog(@"More nav bar: %@", moreViewController.navigationBar);
        NSLog(@"More top item: %@", morenavitem);

        
    }
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setHidden:NO];
    
}


-(void)viewDidDisappear:(BOOL)animated{
    [self.navigationController.navigationBar setHidden:YES];
    
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (tableView.tag ==1) {
        return 44;
    }else{
        return 60;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

#pragma mark - TableView Delegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.topTableView) {
        return 1;
    }
    
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    
    if(tableView == self.topTableView){
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        cell.textLabel.text = @"TOP TABLE CELL";
        
    }else{
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
        cell.textLabel.text = [NSString stringWithFormat:@"INDEXPATH ROW: %li", indexPath.row];

    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    cell.layer.borderWidth = 0.25f;
    
    if(tableView.tag == 1){
        cell.backgroundColor = [UIColor whiteColor];
    }else{
        
        if(indexPath.row %2 == 0){
            cell.backgroundColor = [UIColor lightGrayColor];
        }else{
            cell.backgroundColor = [UIColor darkGrayColor];
        }
        
    }
}


#pragma mark - Add Event Delegate Methods:
- (void)didDismissPresentedViewController
{
    
    NSLog(@"Dismiss presented VC");
    [self dismissViewControllerAnimated:YES completion:NULL];
    NSLog(@"View controller should be dismissed");
}



@end
