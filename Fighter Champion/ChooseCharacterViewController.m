//
//  ChooseCharacterViewController.m
//  Fighter Champion
//
//  Created by Andre Aranha on 12/23/15.
//  Copyright © 2015 Andre Aranha. All rights reserved.
//

#import "ChooseCharacterViewController.h"
#import "BattleViewController.h"
#import "PointsDistributionViewController.h"
#import "FighterManager.h"

#define kOFFSET_FOR_KEYBOARD 80.0

@interface ChooseCharacterViewController ()

@end

@implementation ChooseCharacterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self registerForKeyboardNotifications];
    _nameTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) isCharacterBoy {
    return [self.characterChoiceUI selectedSegmentIndex] == 0;
}

-(void)setNewFighter {
    [[FighterManager getInstance] createPlayerFighter];
    [[FighterManager getInstance].fighter setName:[self.nameTextField text]];
    [[FighterManager getInstance].fighter setPointsToDistribute:20];
    
    NSString *characterImageFilename;
    if ([self.characterChoiceUI selectedSegmentIndex] == 0)
        characterImageFilename = @"001-Fighter01.png";
    else
        characterImageFilename = @"002-Fighter02.png";
    
    [[FighterManager getInstance].fighter setImageFilename:characterImageFilename];
}

- (IBAction)didPressFinishButton:(id)sender {
    PointsDistributionViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"pointsDistribution"];
    [self.navigationController pushViewController:viewController animated:YES];
    [self setNewFighter];
}

- (void) registerForKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void) keyboardWasShown:(NSNotification*)aNotification {
    CGRect rect = self.view.frame;
    // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
    // 2. increase the size of the view so that the area behind the keyboard is covered up.
    rect.origin.y -= kOFFSET_FOR_KEYBOARD;
    rect.size.height += kOFFSET_FOR_KEYBOARD;
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

- (void) keyboardWillBeHidden:(NSNotification*)aNotification {
    CGRect rect = self.view.frame;
    // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
    // 2. increase the size of the view so that the area behind the keyboard is covered up.
    rect.origin.y += kOFFSET_FOR_KEYBOARD;
    rect.size.height -= kOFFSET_FOR_KEYBOARD;
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end