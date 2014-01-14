//
//  TemperatureViewController.h
//  temperature
//
//  Created by Vivek Hariharan on 1/14/14.
//  Copyright (c) 2014 Yahoo! Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemperatureViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *fahrenheitTextField;
@property (nonatomic, strong) IBOutlet UITextField *celsiusTextField;
@property (nonatomic, strong) IBOutlet UIButton *convertButton;


@end
