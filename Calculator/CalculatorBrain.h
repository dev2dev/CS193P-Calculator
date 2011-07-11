//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Michał Listowski on 11-07-03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalculatorBrain : NSObject {
/* We don't need them here because we use @property later
    double operand;
    double storeOperand;
    NSString *waitingOperation;
    double waitingOperand;
 */
}

@property double operand;
@property double storeOperand;
@property (readonly) double waitingOperand;
@property (nonatomic, retain) NSString *waitingOperation;
@property (readonly) id expression;

- (void)setOperand:(double)anOperand;
- (double)performOperation:(NSString *)operation;
- (void)dealloc;
/*
+ (double)evaluateExpression:(id)anExpression usingVariableValues:(NSDictionary *)variables;
+ (NSSet *)variablesInExpression:(id)anExpression;
+ (NSString *)descriptionOfExpression:(id)anExpression;
+ (id)propertyListForExpression:(id)anExpression;
+ (id)expressionForPropertyList:(id)propertyList;
*/
@end
