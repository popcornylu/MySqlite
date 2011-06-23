//
//  MyDateabase.m
//  MySqlite
//
//  Created by Popcorny on 6/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyDateabase.h"
#import "FMDatabase.h"

MyDateabase* sharedInstance;
@implementation MyDateabase
- (void)loadDB
{
    NSURL *appUrl = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSString *dbPath = [[appUrl path] stringByAppendingPathComponent:@"MyDatabase.db"];    
    _db = [[FMDatabase databaseWithPath:dbPath] retain];
    
    if (![_db open]) {        
        NSLog(@"Could not open db");        
        return ;        
    }  
    
    //create the table
    if(![_db executeUpdate:@"CREATE TABLE IF NOT EXISTS user (uid integer primary key asc autoincrement, name text, description text)"])
    {
        NSLog(@"Could not create table: %@", [_db lastErrorMessage]);
    }
}

- (id)init
{
    self = [super init];
    if(self)
    {
        [self loadDB];
    }
    return self;
}

- (void)addWithName:(NSString*)name 
     andDescription:(NSString*)description;
{
    if(![_db executeUpdate:@"INSERT INTO user (name, description) VALUES (?,?)", name, description])
    {
        NSLog(@"Could not insert data: %@", [_db lastErrorMessage]);
    }    
}

- (void)deleateData:(int)uid
{
    if(![_db executeUpdate:@"DELETE FROM user WHERE uid = ?", [NSNumber numberWithInt:uid]])
    {
        NSLog(@"Could not delete data: %@", [_db lastErrorMessage]);
    }    
}

- (id)query
{        
    NSMutableArray* items = [NSMutableArray arrayWithCapacity:0];
    
    FMResultSet *rs = [_db executeQuery:@"SELECT uid, name, description from user"];
    
    while ([rs next]) {        
        int uid = [rs intForColumn:@"uid"];
        NSString *name = [rs stringForColumn:@"name"];        
        NSString *description = [rs stringForColumn:@"description"];        
        
        [items addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                          [NSNumber numberWithInt:uid], @"uid",
                          name, @"name", 
                          description, @"description", 
                          nil]];
    }
    
    [rs close];    
    return items;
}

- (id)queryByString:(NSString*)string
{        
    NSMutableArray* items = [NSMutableArray arrayWithCapacity:0];
    
    NSString* query = [NSString stringWithFormat:@"%%%@%%", string];
    FMResultSet *rs = [_db executeQuery:@"SELECT uid, name, description from user where name LIKE ? OR description LIKE ?", query, query];
    
    while ([rs next]) {        
        int uid = [rs intForColumn:@"uid"];
        NSString *name = [rs stringForColumn:@"name"];        
        NSString *description = [rs stringForColumn:@"description"];        
        
        [items addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                          [NSNumber numberWithInt:uid], @"uid",
                          name, @"name", 
                          description, @"description", 
                          nil]];
    }
    
    [rs close];    
    return items;
}

+ (MyDateabase*)sharedInstance
{
    if(sharedInstance == nil)
    {
        sharedInstance = [[MyDateabase alloc] init];        
    }
    return sharedInstance;
    
}

@end
