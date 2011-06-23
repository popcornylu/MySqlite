//
//  RootViewController.h
//  MySqlite
//
//  Created by Popcorny on 6/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RootViewController : UITableViewController <UISearchBarDelegate>
{
    NSMutableArray* _items;
    UISearchBar* _searchbar;
}

@property (nonatomic, retain) NSMutableArray* items;
@end
