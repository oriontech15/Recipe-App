//
//  RecipeDetailViewController.m
//  Recipe App
//
//  Created by Justin Smith on 7/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeDetailViewController.h"
#import "RARecipes.h"

static const CGFloat margin = 15;

@interface RecipeDetailViewController ()



@end

@implementation RecipeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = [RARecipes titleAtIndex: self.recipeIndex];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.addDetailView];
}

- (UIView *)addDetailView
{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(margin, 6, CGRectGetWidth(self.view.frame), 44 + (margin * 2))];
    view.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, 2, CGRectGetWidth(self.view.frame) - margin * 2, 44)];
    descriptionLabel.text = [RARecipes descriptionAtIndex:self.recipeIndex];
    descriptionLabel.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:descriptionLabel];
    
    __unused UILabel *ingredientsLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, 70, CGRectGetWidth(self.view.frame), 44)];
    
    return view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
