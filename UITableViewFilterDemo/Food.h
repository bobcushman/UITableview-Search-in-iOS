//
//  Food.h
//  UITableViewFilterDemo
//
//  Created by Marty Dill on 12-03-24.
//  Copyright (c) 2012 Marty Dill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject

@property (nonatomic, retain) NSString* name;

@property (nonatomic, retain) NSString* description;

-(id) initWithName:(NSString*) theName andDescription:(NSString*)theDescription;

@end
