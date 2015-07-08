//
//  RAViewController.m
//  Recipe App
//
//  Created by Justin Smith on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RAViewController.h"
#import "RecipesTableViewDataSource.h"

@interface RAViewController ()

@property (strong, nonatomic) RecipesTableViewDataSource *dataSource;
//@property (strong, nonatomic) UITableView *tableView;

@end

@implementation RAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor lightGrayColor];
    self.dataSource = [RecipesTableViewDataSource new];
    tableView.dataSource = self.dataSource;
    [self.dataSource registerRecipeTableView:tableView];
    [self.view addSubview:tableView];
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
