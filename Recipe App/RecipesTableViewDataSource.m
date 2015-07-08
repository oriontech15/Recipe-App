//
//  RecipesTableViewDataSource.m
//  Recipe App
//
//  Created by Justin Smith on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipesTableViewDataSource.h"
#import "RARecipes.h"

@implementation RecipesTableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [RARecipes count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
