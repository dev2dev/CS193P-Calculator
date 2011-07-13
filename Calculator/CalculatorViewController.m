//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Michał Listowski on 11-07-03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController
@synthesize display;
@synthesize mem;
@synthesize brain;
@synthesize userIsInTheMiddleOfTypingANumber;

- (CalculatorBrain *)brain{
    if (!brain) {
        brain = [[CalculatorBrain alloc] init];
    }
    return brain;
}

- (IBAction)digitPressed:(UIButton *)sender{
    //NSString *digit = [[sender titleLabel] text];
    NSString *digit = sender.titleLabel.text;
    if ([@"<" isEqual:digit]) {
        self.brain.lengthOfDisplay = [display.text length];
        display.text = [display.text stringByPaddingToLength:self.brain.lengthOfDisplay-1 withString:display.text startingAtIndex:0 ];
    }else{
        if(userIsInTheMiddleOfTypingANumber){
            //[display setText:[[display text] stringByAppendingString:digit]];
            display.text = [display.text stringByAppendingString:digit];
        }else{
            //[display setText:digit];
            display.text = digit;
            userIsInTheMiddleOfTypingANumber = YES;
        }
        mem.text = [NSString stringWithFormat:@"%g", self.brain.storeOperand];
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
    mem.text = [NSString stringWithFormat:@"%g", self.brain.storeOperand];
}

- (void)releaseOutlets{
    self.display = nil;
}
- (void)viewDidLoad{
    [super viewDidLoad];
}
- (void)viewDidUnload{
    [self releaseOutlets];
}
- (void)dealloc{
    [brain release];
    [display release];
    [self releaseOutlets];
    [super dealloc];
}

@end
