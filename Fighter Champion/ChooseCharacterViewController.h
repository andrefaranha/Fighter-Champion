//
//  ChooseCharacterViewController.h
//  Fighter Champion
//
//  Created by Andre Aranha on 12/23/15.
//  Copyright © 2015 Andre Aranha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseCharacterViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *characterChoiceUI;

@end