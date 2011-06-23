//
//  UserAddViewController.h
//  MySqlite
//
//  Created by Popcorny on 6/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UserAddViewController : UIViewController {   
    UITextField *tfName;
    UITextField *tfDescription;
}

@property (nonatomic, retain) IBOutlet UITextField *tfName;
@property (nonatomic, retain) IBOutlet UITextField *tfDescription;

- (IBAction)add:(id)sender;

@end
