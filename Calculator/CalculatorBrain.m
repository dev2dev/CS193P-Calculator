//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Michał Listowski on 11-07-03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"


@implementation CalculatorBrain
- (void)setOperand:(double)anOperand{
    operand = anOperand;
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
    }else if([@"sin" isEqual:waitingOperation]){
        operand = sin(operand);
    }else if([@"cos" isEqual:waitingOperation]){
        operand = cos(operand);
    }else if([@"tan" isEqual:waitingOperation]){
        operand = tan(operand);
    }else if([@"ctan" isEqual:waitingOperation]){
        if (operand) {
            operand = (double)1/tan(operand);
        }
    }
}
- (double)performOperation:(NSString *)operation{
    if([operation isEqual:@"sqrt"]){
        operand = sqrt(operand);
    } else{
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    return operand;
}
@end
