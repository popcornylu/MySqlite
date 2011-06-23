//
//  MyDateabase.h
//  MySqlite
//
//  Created by Popcorny on 6/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMDatabase;

@interface MyDateabase : NSObject {   
    FMDatabase* _db;
}

- (void)addWithName:(NSString*)name 
     andDescription:(NSString*)description;
- (void)deleateData:(int)uid;
- (id)query;
- (id)queryByString:(NSString*)string;

+ (MyDateabase*)sharedInstance;

@end
