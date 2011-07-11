//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Michał Listowski on 11-07-03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"


@implementation CalculatorBrain

@synthesize operand;
@synthesize waitingOperand;
@synthesize waitingOperation;

- (void)performWaitingOperation{
    if([@"+" isEqual:waitingOperation]){
        operand = waitingOperand + operand;
    }else if([@"-" isEqual:waitingOperation]){
        operand = waitingOperand - operand;
    }else if([@"*" isEqual:waitingOperation]){
        operand = waitingOperand * operand;
    }else if([@"/" isEqual:waitingOperation]){
        if(operand){
            operand = waitingOperand / operand;
        }
    }
}
- (double)performOperation:(NSString *)operation{
    if([operation isEqual:@"sqrt"]){
        operand = sqrt(operand);
    }else if([operation isEqual:@"+/-"]){
        operand = operand * (double)-1;
    }else if([operation isEqual:@"sin"]){
        operand = sin(operand);
    }else if([operation isEqual:@"cos"]){
        operand = cos(operand);
    }else{
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    return operand;
}
- (void)dealloc{
    [waitingOperation release];
    [super dealloc];
}
@end
