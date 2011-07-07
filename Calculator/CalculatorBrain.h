//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Michał Listowski on 11-07-03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalculatorBrain : NSObject {
    double operand;
    NSString *waitingOperation;
    double waitingOperand;
}
- (void)setOperand:(double)anOperand;
- (double)performOperation:(NSString *)operation;
@end
