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
    double storeOperand;
    NSString *waitingOperation;
    double waitingOperand;
}

@property double operand;
@property double storeOperand;
@property (readonly) double waitingOperand;
@property (nonatomic, retain) NSString *waitingOperation;

- (void)setOperand:(double)anOperand;
- (double)performOperation:(NSString *)operation;
- (void)dealloc;

@end
