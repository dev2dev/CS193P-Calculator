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
@synthesize storeOperand;
@synthesize waitingOperand;
@synthesize waitingOperation;
@synthesize expression;

- (void)dealloc{
    [waitingOperation release];
    [super dealloc];
}

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
    }else if([operation isEqual:@"1/x"]){
        if (operand) {
            operand = (double)1/operand;
        }
    }else if([operation isEqual:@"Store"]){
        storeOperand = operand;
    }else if([operation isEqual:@"Recall"]){
        operand = storeOperand;
    }else if([operation isEqual:@"Mem+"]){
        storeOperand += operand;
    }else if([operation isEqual:@"C"]){
        operand = 0;
        storeOperand = 0;
    }else if([operation isEqual:@"Deg"]){
        
    }else if([operation isEqual:@"Rad"]){
        
    }else{
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    return operand;
}
@end
