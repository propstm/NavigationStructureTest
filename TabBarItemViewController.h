//
//  TabBarItemViewController.h
//  NavigationStructureTest
//
//  Created by matt.propst on 7/3/15.
//  Copyright (c) 2015 matt.propst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarItemViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *topTableView;
@property (weak, nonatomic) IBOutlet UITableView *bottomTableview;

@end
