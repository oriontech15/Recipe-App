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
static CGFloat topMargin = 20;
static CGFloat top;

@interface RecipeDetailViewController ()



@end

@implementation RecipeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = [RARecipes titleAtIndex:self.recipeIndex];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.addDetailView];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, top + margin);
}

- (UIView *)addDetailView
{
    //Adds a view to place on the main scroll view.
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(margin, 6, CGRectGetWidth(self.view.frame) - 30, self.view.frame.size.height)];
    //view.backgroundColor = [UIColor lightGrayColor];
    
    //sets the height of the label based on the length of the description text to the description label
    CGFloat descriptionHeight = [self heightForDescription:[RARecipes descriptionAtIndex:self.recipeIndex]];
    
    //Adds a description label for displaying the description of each item
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin, CGRectGetWidth(self.view.frame) - margin * 2, descriptionHeight)];
    descriptionLabel.text = [RARecipes descriptionAtIndex:self.recipeIndex];
    descriptionLabel.numberOfLines = 0;
    //descriptionLabel.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:descriptionLabel];
    
    top = topMargin + descriptionHeight + margin * 2;
    
    //Adds a title for the ingredients section or the scrollview
    UILabel *ingredientsTitle = [UILabel new];
    ingredientsTitle.text = @"Ingredients";
    ingredientsTitle.font = [UIFont fontWithName:@"San Serif" size:18];
    [view addSubview:ingredientsTitle];
    
    top += topMargin + margin;
    
    //increments through the dictionary of the list of ingredients to get out the type and volume for each ingredient
    for (int i = 0; i < [RARecipes ingredientCountAtIndex:self.recipeIndex]; i++)
    {
        //Adds a label display the type of ingredient
        UILabel *ingredientsTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, (self.view.frame.size.width - 2 * margin), 20)];
        ingredientsTypeLabel.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        ingredientsTypeLabel.font = [UIFont boldSystemFontOfSize:17];
        ingredientsTypeLabel.numberOfLines = 0;
        [view addSubview:ingredientsTypeLabel];
        
        //Adds a label displaying the volume or quanity of the ingredients
        UILabel *ingredientsVolumeLabel = [[UILabel alloc] initWithFrame:CGRectMake((margin + self.view.frame.size.width - 2 * margin) * 0.75, top, CGRectGetWidth(self.view.frame), 20)];
        ingredientsVolumeLabel.text = [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        [view addSubview:ingredientsVolumeLabel];
        
        top += topMargin + margin;
    }
    
    top += margin;
    
    //Adds a title above the labels for each step of the directions
    UILabel *directionsTitle = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20)];
    directionsTitle.text = @"Description";
    directionsTitle.font = [UIFont fontWithName:@"San Serif" size:18];
    [view addSubview:directionsTitle];
    
    top += topMargin + margin;
    
    for (int i = 0; i < [[RARecipes directionsAtIndex:self.recipeIndex] count]; i++)
    {
        CGFloat height = [self heightForDirections:[RARecipes directionsAtIndex:self.recipeIndex][i]];
        
        UILabel *count = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, 30, 20)];
        count.font = [UIFont boldSystemFontOfSize:17];
        count.text = [NSString stringWithFormat:@"%d", i +1];
        [view addSubview:count];
        
        UILabel *directionLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin + 15, top, (self.view.frame.size.width - 2 * margin - 40), height)];
        directionLabel.text = [RARecipes directionsAtIndex:self.recipeIndex][i];
        directionLabel.numberOfLines = 0;
        
        [view addSubview:directionLabel];
        
        top +=(height + margin);
    }
    
    return view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)heightForDescription:(NSString *)description
{
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return bounding.size.height;
}

- (CGFloat)heightForDirections:(NSString *)description
{
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin -40, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return bounding.size.height;
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
