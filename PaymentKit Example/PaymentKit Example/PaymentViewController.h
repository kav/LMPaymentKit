//
//  ViewController.h
//  PKPayment Example
//
//  Created by Alex MacCaw on 1/21/13.
//  Copyright (c) 2013 Stripe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKView.h"
#import <JVFloatLabeledTextField/JVFloatLabeledTextField.h>

@interface PaymentViewController : UIViewController <PKViewDelegate>

@property IBOutlet UILabel *helpLabel;
@property IBOutlet PKView *paymentView;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *nameField;

@end
