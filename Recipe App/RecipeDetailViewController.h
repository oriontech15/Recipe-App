//
//  RecipeDetailViewController.h
//  Recipe App
//
//  Created by Justin Smith on 7/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailViewController : UIViewController

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic, assign) NSInteger recipeIndex;

- (UIView *) addDetailView;

@end
