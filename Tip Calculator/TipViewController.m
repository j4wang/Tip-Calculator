//
//  TipViewController.m
//  Tip Calculator
//
//  Created by John on 9/17/13.
//  Copyright (c) 2013 John. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()

// TODO: look up difference between weak and retain
// set up connection to UI elements
@property (retain, nonatomic) IBOutlet UITextField *billTextField;
@property (retain, nonatomic) IBOutlet UILabel *tipLabel;
@property (retain, nonatomic) IBOutlet UILabel *totalLabel;
@property (retain, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)initValues;
- (void)updateValues;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"John's Tip Controller";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_billTextField release];
    [_tipLabel release];
    [_totalLabel release];
    [_tipControl release];
    [_billTextField release];
    [_tipLabel release];
    [_totalLabel release];
    [_tipControl release];
    [super dealloc];
}
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    // update values
    [self updatesValues];
}

- (void)initValues {
    float tipAmount = 0;
    float totalAmount = 0;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)updatesValues {
    float billAmount = [self.billTextField.text floatValue];
    
    // create tip array
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    
    // get the segment index to determine tip percentage
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = billAmount + tipAmount;
    
    // write values back in labels
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}
@end
