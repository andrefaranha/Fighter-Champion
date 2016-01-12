//
//  PointsDistributionViewController.h
//  Fighter Champion
//
//  Created by Andre Aranha on 12/23/15.
//  Copyright © 2015 Andre Aranha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BattleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *fighterNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *playerFigtherImageView;
@property (weak, nonatomic) IBOutlet UIImageView *enemyFigtherImageView;
@property (weak, nonatomic) IBOutlet UILabel *hpValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *atkValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *defValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *enemyHpValue;
@property (weak, nonatomic) IBOutlet UILabel *enemyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UIButton *attackButton;
@property (weak, nonatomic) IBOutlet UIButton *defendButton;
@property (weak, nonatomic) IBOutlet UIView *endBattleView;
@property (weak, nonatomic) IBOutlet UILabel *endBattleLabel;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;

@end
