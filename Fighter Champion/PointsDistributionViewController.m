//
//  PointsDistributionViewController.m
//  Fighter Champion
//
//  Created by Andre Aranha on 12/24/15.
//  Copyright © 2015 Andre Aranha. All rights reserved.
//

#import "PointsDistributionViewController.h"
#import "BattleViewController.h"
#import "FighterManager.h"

@implementation PointsDistributionViewController

Fighter *fighter;

-(void)viewDidLoad {
    [super viewDidLoad];
    
    fighter = [[FighterManager getInstance] fighter];
    [self.characterImageView setImage:[UIImage imageNamed:[fighter imageFilename]]];
    [self updateFighterValues:fighter];
    [self updateButtons];
}

-(void)updateFighterValues:(Fighter *)fighter {
    [self.nameLabel setText:[fighter name]];
    
    [self.maxHpValueLabel setText:[NSString stringWithFormat:@"%d", [fighter maxHp]]];
    [self.atkValueLabel setText:[NSString stringWithFormat:@"%d", [fighter atk]]];
    [self.defValueLabel setText:[NSString stringWithFormat:@"%d", [fighter def]]];
    [self.pointsLeftValueLabel setText:[NSString stringWithFormat:@"%d", [fighter pointsToDistribute]]];
}

-(void)updateButtons {
    if ([fighter pointsToDistribute] == 0) {
        self.incMaxHpButton.enabled = NO;
        self.incAtkButton.enabled = NO;
        self.incDefButton.enabled = NO;
    } else {
        self.incMaxHpButton.enabled = YES;
        self.incAtkButton.enabled = YES;
        self.incDefButton.enabled = YES;
    }
    
    if ([fighter maxHp] == 1)
        self.decMaxHpButton.enabled = NO;
    else
        self.decMaxHpButton.enabled = YES;
    
    if ([fighter atk] == 0)
        self.decAtkButton.enabled = NO;
    else
        self.decAtkButton.enabled = YES;
    
    if ([fighter def] == 0)
        self.decDefButton.enabled = NO;
    else
        self.decDefButton.enabled = YES;
}

- (IBAction)incMaxHpButtonPressed:(id)sender {
    if ([fighter pointsToDistribute] > 0) {
        [fighter incMaxHpBy:1];
        [fighter decPointsToDistributeBy:1];
    }
    [self updateFighterValues:fighter];
    [self updateButtons];
}

- (IBAction)decMaxHpButtonPressed:(id)sender {
    if ([fighter maxHp] > 1) {
        [fighter decMaxHpBy:1];
        [fighter incPointsToDistributeBy:1];
    }
    [self updateFighterValues:fighter];
    [self updateButtons];
}

- (IBAction)incAtkButtonPressed:(id)sender {
    if ([fighter pointsToDistribute] > 0) {
        [fighter incAtkBy:1];
        [fighter decPointsToDistributeBy:1];
    }
    [self updateFighterValues:fighter];
    [self updateButtons];
}

- (IBAction)decAtkButtonPressed:(id)sender {
    if ([fighter atk] > 0) {
        [fighter decAtkBy:1];
        [fighter incPointsToDistributeBy:1];
    }
    [self updateFighterValues:fighter];
    [self updateButtons];
}

- (IBAction)incDefButtonPressed:(id)sender {
    if ([fighter pointsToDistribute] > 0) {
        [fighter incDefBy:1];
        [fighter decPointsToDistributeBy:1];
    }
    [self updateFighterValues:fighter];
    [self updateButtons];
}

- (IBAction)decDefButtonPressed:(id)sender {
    if ([fighter def] > 0) {
        [fighter decDefBy:1];
        [fighter incPointsToDistributeBy:1];
    }
    [self updateFighterValues:fighter];
    [self updateButtons];
}

- (IBAction)startTournamentButtonPressed:(id)sender {
    [[FighterManager getInstance] nextEnemy];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BattleViewController *b = [mainStoryboard instantiateViewControllerWithIdentifier:@"battle"];
    [self presentViewController:b animated:YES completion:nil];
}

@end
