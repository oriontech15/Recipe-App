//
//  RecipesTableViewDataSource.h
//  Recipe App
//
//  Created by Justin Smith on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RecipesTableViewDataSource : NSObject <UITableViewDataSource>

-(void)registerRecipeTableView:(UITableView *)tableView;

@end
