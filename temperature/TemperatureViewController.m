//
//  TemperatureViewController.m
//  temperature
//
//  Created by Vivek Hariharan on 1/14/14.
//  Copyright (c) 2014 Yahoo! Inc. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()

@property (nonatomic) BOOL fahrenheitTextChanged;
@property (nonatomic) BOOL celsiusTextChanged;


-(void)updateValues;
-(void)onDoneButton;
-(void)fahrenheitTextFieldDidChange;
-(void)celsiusTextFieldDidChange;

@end

@implementation TemperatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    self.fahrenheitTextChanged = NO;
    self.celsiusTextChanged = NO;
    
    self.celsiusTextField.delegate = self;
    self.fahrenheitTextField.delegate = self;
    
    [self.convertButton addTarget:self action:@selector(updateValues) forControlEvents:UIControlEventTouchDown];
    
    [self.fahrenheitTextField addTarget:self action:@selector(fahrenheitTextFieldDidChange) forControlEvents:UIControlEventEditingChanged];
    [self.celsiusTextField addTarget:self action:@selector(celsiusTextFieldDidChange) forControlEvents:UIControlEventEditingChanged];
    
    //[self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - UITextField delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    UIBarButtonItem *doneButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone  target:self action:@selector(onDoneButton)];
    self.navigationItem.rightBarButtonItem = doneButtonItem;
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}

#pragma mark - Private methods
-(void)fahrenheitTextFieldDidChange {
    NSLog(@"fahrenheitTextField changed");
    self.fahrenheitTextChanged = YES;
}

-(void)celsiusTextFieldDidChange {
    NSLog(@"celsiusTextField changed");
    self.celsiusTextChanged = YES;
}

-(void)updateValues {
    //NSLog(@"calling updateValues");
    float fahrenheitValue = [self.fahrenheitTextField.text floatValue];
    float celsiusValue = [self.celsiusTextField.text floatValue];
    NSLog (@"fahrenheit: @%f", fahrenheitValue);
    NSLog (@"celsius: @%f", celsiusValue);
    NSLog(@"fahren changed: @%d", self.fahrenheitTextChanged);
    
    if (celsiusValue == 0 || (fahrenheitValue != 0 && self.fahrenheitTextChanged)) {
        NSLog(@"first if");
        celsiusValue = (fahrenheitValue - 32)*5/9;
        self.celsiusTextField.text = [NSString stringWithFormat:@"%0.1f", celsiusValue];
    }
    else if (celsiusValue != 0 && self.celsiusTextChanged) {
        NSLog(@"second if");
        fahrenheitValue = (9*celsiusValue/5) + 32;
        self.fahrenheitTextField.text = [NSString stringWithFormat:@"%0.1f", fahrenheitValue];
    }
    self.fahrenheitTextChanged = NO;
    self.celsiusTextChanged = NO;
}

-(void) onDoneButton {
    [self.view endEditing:YES];
    self.navigationItem.rightBarButtonItem = nil;
}

@end
