//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Michał Listowski on 11-07-03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController()
@property (readonly) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

- (CalculatorBrain *)brain{
    if (!brain) {
        brain = [[CalculatorBrain alloc] init];
    }
    return brain;
}

- (IBAction)digitPressed:(UIButton *)sender{
    //NSString *digit = [[sender titleLabel] text];
    NSString *digit = sender.titleLabel.text;
    if(userIsInTheMiddleOfTypingANumber){
        //[display setText:[[display text] stringByAppendingString:digit]];
        display.text = [display.text stringByAppendingString:digit];
    }else{
        //[display setText:digit];
        display.text = digit;
        userIsInTheMiddleOfTypingANumber = YES;
    }
}
- (IBAction)operationPressed:(UIButton *)sender{
    if (userIsInTheMiddleOfTypingANumber) {
        self.brain.operand = [display.text doubleValue];
        userIsInTheMiddleOfTypingANumber = NO;
    }
    NSString *operation = [[sender titleLabel] text];
    //double result = [[self brain] performOperation:operation];
    [self.brain performOperation:operation];
    display.text = [NSString stringWithFormat:@"%g", self.brain.operand];
}

@end
