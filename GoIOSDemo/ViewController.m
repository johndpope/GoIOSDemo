//
//  ViewController.m
//  HelloGo
//
//  Created by James Schofield on 2015-04-15.
//  Copyright (c) 2015 Couch Labs Inc. All rights reserved.
//

#import "ViewController.h"
#import "go_includes.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *number1;
@property (strong, nonatomic) IBOutlet UITextField *number2;
@property (strong, nonatomic) IBOutlet UITextField *numberResult;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)recompute:(id)sender {
    // Add function defined in main.go
    int result = Add(self.number1.text.intValue, self.number2.text.intValue);
    self.numberResult.text = @(result).stringValue;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
