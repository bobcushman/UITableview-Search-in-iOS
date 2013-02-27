//
//  FilterDemoTableViewController.m
//  UITableViewFilterDemo
//
//  Created by Marty Dill on 12-03-24.
//  Copyright (c) 2012 Marty Dill. All rights reserved.
//

#import "FilterDemoTableViewController.h"
#import "Food.h"

@implementation FilterDemoTableViewController

@synthesize allTableData;
@synthesize filteredTableData;
@synthesize searchBar;
@synthesize isFiltered;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBar.hidden = NO;
    searchBar.delegate = (id)self;
    
    allTableData = [[NSMutableArray alloc] initWithObjects:
                                    [[Food alloc] initWithName:@"Steak" andDescription:@"Rare"], 
                                    [[Food alloc] initWithName:@"Steak" andDescription:@"Medium"], 
                                    [[Food alloc] initWithName:@"Salad" andDescription:@"Caesar"], 
                                    [[Food alloc] initWithName:@"Salad" andDescription:@"Bean"], 
                                    [[Food alloc] initWithName:@"Fruit" andDescription:@"Apple"], 
                                    [[Food alloc] initWithName:@"Potato" andDescription:@"Baked"], 
                                    [[Food alloc] initWithName:@"Potato" andDescription:@"Mashed"], 
                                    [[Food alloc] initWithName:@"Bread" andDescription:@"White"], 
                                    [[Food alloc] initWithName:@"Bread" andDescription:@"Brown"], 
                                    [[Food alloc] initWithName:@"Hot Dog" andDescription:@"Beef"], 
                                    [[Food alloc] initWithName:@"Hot Dog" andDescription:@"Chicken"], 
                                    [[Food alloc] initWithName:@"Hot Dog" andDescription:@"Veggie"], 
                                    [[Food alloc] initWithName:@"Pizza" andDescription:@"Pepperonni"], 
                                    nil ];
}

- (void)viewDidUnload
{
    [self setSearchBar:nil];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int rowCount;
    if(self.isFiltered)
        rowCount = filteredTableData.count;
    else
        rowCount = allTableData.count;
    
    return rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
    Food* food;
    if(isFiltered)
        food = [filteredTableData objectAtIndex:indexPath.row];
    else
        food = [allTableData objectAtIndex:indexPath.row];
    
    cell.textLabel.text = food.name;
    cell.detailTextLabel.text = food.description;
   // cell.imageView.image = [UIImage imageNamed:@"d.png"];
    return cell;
}

#pragma mark - Table view delegate

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text
{
    if(text.length == 0)
    {
        isFiltered = FALSE;
    }
    else
    {
        isFiltered = true;
        filteredTableData = [[NSMutableArray alloc] init];
        
        for (Food* food in allTableData)
        {
            NSRange nameRange = [food.name rangeOfString:text options:NSCaseInsensitiveSearch];
            NSRange descriptionRange = [food.description rangeOfString:text options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound || descriptionRange.location != NSNotFound)
            {
                [filteredTableData addObject:food];
            }
        }
    }
    
    [self.tableView reloadData];
}

@end
