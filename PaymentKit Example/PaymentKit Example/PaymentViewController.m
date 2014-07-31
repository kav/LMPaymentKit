//
//  ViewController.m
//  PKPayment Example
//
//  Created by Alex MacCaw on 1/21/13.
//  Copyright (c) 2013 Stripe. All rights reserved.
//

#import "PaymentViewController.h"

@implementation PaymentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.paymentView.delegate = self;
	[self.paymentView becomeFirstResponder];
    self.paymentView.imageStyle = PKViewImageStyleOutline;
    self.paymentView.borderStyle = UITextBorderStyleLine;
    self.paymentView.floatingLabel.text = @"Credit card";
    
    self.nameField.placeholder = @"First Name";
    self.nameField.font = [UIFont systemFontOfSize:12.0f];
    self.nameField.floatingLabelFont = [UIFont fontWithName:@"HelveticaNeue_Light" size:12.0f];
    self.nameField.floatingLabelYPadding = @-5;
    self.nameField.tintColor = [UIColor blackColor];
                                        
}

- (void)paymentView:(PKView *)paymentView withCard:(PKCard *)card isValid:(BOOL)valid
{
    self.navigationItem.rightBarButtonItem.enabled = valid;
}

- (void)paymentView:(PKView *)paymentView didChangeState:(PKViewState)state
{
	switch (state) {
		case PKViewStateCardNumber:
			self.helpLabel.text = @"Enter card number";
			break;
			
		case PKViewStateExpiry:
			self.helpLabel.text = @"Enter expiry date";
			break;
			
		case PKViewStateCVC:
			self.helpLabel.text = @"Enter security code";
			break;
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender
{
    PKCard *card = self.paymentView.card;
    
    NSLog(@"Card last4: %@", card.last4);
    NSLog(@"Card expiry: %lu/%lu", (unsigned long)card.expMonth, (unsigned long)card.expYear);
    NSLog(@"Card cvc: %@", card.cvc);
    
    [[NSUserDefaults standardUserDefaults] setValue:card.last4 forKey:@"card.last4"];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
