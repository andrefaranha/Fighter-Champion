//
//  PointsDistributionViewController.m
//  Fighter Champion
//
//  Created by Andre Aranha on 12/23/15.
//  Copyright © 2015 Andre Aranha. All rights reserved.
//

#import "BattleViewController.h"
#import "FighterManager.h"
#import "Battle.h"

@implementation BattleViewController

Battle *battle;

-(void) viewDidLoad {
    [super viewDidLoad];
    
    [self.endBattleView setHidden:YES];
    
    Fighter *fighter = [[FighterManager getInstance] fighter];
    [fighter recover];
    
    Fighter *enemy = [[FighterManager getInstance] getEnemyWithId:[[FighterManager getInstance] currentEnemyId]];
    [enemy recover];
    
    battle = [[Battle alloc] initWithFighter:fighter andEnemy:enemy];
    
    self.fighterNameLabel.text = [fighter name];
    self.enemyNameLabel.text = [enemy name];
    
    [self.playerFigtherImageView setImage:[UIImage imageNamed:[fighter imageFilename]]];
    [self.enemyFigtherImageView setImage:[UIImage imageNamed:[enemy imageFilename]]];
    [self updateStatusFromFighters];
    
    [self updateInfo:[NSString stringWithFormat:@"%@ turn", [battle fighterInTurn]]];
}

-(void)updateStatusFromFighters {
    [self.hpValueLabel setText:[NSString stringWithFormat:@"%d", [[battle fighter] hp]]];
    [self.atkValueLabel setText:[NSString stringWithFormat:@"%d", [[battle fighter] atk]]];
    [self.defValueLabel setText:[NSString stringWithFormat:@"%d", [[battle fighter] def]]];
    
    [self.enemyHpValue setText:[NSString stringWithFormat:@"%d", [[battle enemy] hp]]];
}

-(void)updateStatusFromCommandsWithDamageDealt:(int)damageDealt {
    
}

-(void)updateInfo:(NSString *)newInfo {
    self.infoLabel.text = newInfo;
}

-(void)setCommandButtonEnabled:(BOOL)enabled {
    [self.attackButton setEnabled:enabled];
    [self.defendButton setEnabled:enabled];
}

-(void)endTurn {
    [battle endTurn];
    if ([battle gameRunning]) {
        if ([battle isFighterInTurn:[battle fighter]])
            [self setCommandButtonEnabled:YES];
        else
            [self setCommandButtonEnabled:NO];
    
        [self updateInfo:[NSString stringWithFormat:@"%@ turn", [battle fighterInTurn]]];
    } else {
        if ([[battle fighter] isDead]) {
            self.endBattleLabel.text = @"Game Over";
            [self.continueButton setHidden:YES];
        } else {
            self.endBattleLabel.text = @"You Win";
        }
        [self.endBattleView setHidden:NO];
    }
}

-(void)performAttackWithFighterInTurn {
    int damageDealt = [battle attackEnemy:[battle getFighterNotInTurn] withFighter:[battle fighterInTurn]];
    [self updateStatusFromCommandsWithDamageDealt:damageDealt];
    [self endTurn];
    [self updateStatusFromFighters];
}

- (IBAction)attackButtonPressed:(id)sender {
    if ([battle isFighterInTurn:[battle fighter]] && [battle gameRunning]) {
        [self performAttackWithFighterInTurn];
        [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(performAttackWithFighterInTurn) userInfo:nil repeats:NO];
    }
    
}

- (IBAction)defendButtonPressed:(id)sender {
}

-(void)loadNextSceneWithId:(NSString *)sceneId {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BattleViewController *b = [mainStoryboard instantiateViewControllerWithIdentifier:sceneId];
    [self presentViewController:b animated:YES completion:nil];
}

- (IBAction)nextBattleButtonPressed:(id)sender {
    [[[FighterManager getInstance] fighter] incPointsToDistributeBy:10];
    if ([[FighterManager getInstance] hasMoreEnemies])
        [self loadNextSceneWithId:@"pointsDistribution"];
    else
        [self loadNextSceneWithId:@"victory"];
}

- (IBAction)exitButtonPressed:(id)sender {
    [[FighterManager getInstance] reset];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BattleViewController *b = [mainStoryboard instantiateViewControllerWithIdentifier:@"title"];
    [self presentViewController:b animated:YES completion:nil];
}

@end
