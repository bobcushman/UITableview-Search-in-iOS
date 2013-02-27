//
//  Food.m
//  UITableViewFilterDemo
//
//  Created by Marty Dill on 12-03-24.
//  Copyright (c) 2012 Marty Dill. All rights reserved.
//

#import "Food.h"

@implementation Food

@synthesize name;

@synthesize description;


-(id) initWithName:(NSString *)theName andDescription:(NSString *)theDescription
{
    self = [super init];
    if(self)
    {
        self.name = theName;
        self.description = theDescription;
    }
    return self;
}

@end
