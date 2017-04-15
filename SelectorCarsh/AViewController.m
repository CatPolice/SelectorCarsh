//
//  AViewController.m
//  SelectorCarsh
//
//  Created by 谷玉 on 2017/4/15.
//  Copyright © 2017年 gavin. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@property (weak, nonatomic) IBOutlet UIButton *carshButtonOutlet;
@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.carshButtonOutlet addTarget:self action:@selector(aButtonCarsh) forControlEvents:UIControlEventTouchDown];
    
}

@end
