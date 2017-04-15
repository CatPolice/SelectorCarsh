//
//  ViewController.m
//  SelectorCarsh
//
//  Created by runlin on 17/4/13.
//  Copyright © 2017年 gavin. All rights reserved.
//

#import "ViewController.h"
#import "AViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *carshButtonOutlet;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.carshButtonOutlet addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchDown];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
