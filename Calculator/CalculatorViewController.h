//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Michał Listowski on 11-07-03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface CalculatorViewController : UIViewController {
    IBOutlet UILabel *display;
    BOOL userIsInTheMiddleOfTypingANumber;
    
    
}
@property (nonatomic, retain) IBOutlet UILabel *display;
@property (nonatomic, retain) CalculatorBrain *brain;

- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;
@end
