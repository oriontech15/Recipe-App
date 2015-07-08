//
//  RecipesTableViewDataSource.m
//  Recipe App
//
//  Created by Justin Smith on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipesTableViewDataSource.h"
#import "RARecipes.h"

static NSString *cellID = @"cellID";

@implementation RecipesTableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [RARecipes count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.textLabel.text = [RARecipes titleAtIndex:indexPath.row];
    
    return cell;
}

-(void)registerRecipeTableView:(UITableView *)tableView
{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
}

@end
