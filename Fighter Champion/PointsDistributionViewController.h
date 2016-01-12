//
//  PointsDistributionViewController.h
//  Fighter Champion
//
//  Created by Andre Aranha on 12/24/15.
//  Copyright © 2015 Andre Aranha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PointsDistributionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *maxHpValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *atkValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *defValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointsLeftValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *incMaxHpButton;
@property (weak, nonatomic) IBOutlet UIButton *decMaxHpButton;
@property (weak, nonatomic) IBOutlet UIButton *incAtkButton;
@property (weak, nonatomic) IBOutlet UIButton *decAtkButton;
@property (weak, nonatomic) IBOutlet UIButton *incDefButton;
@property (weak, nonatomic) IBOutlet UIButton *decDefButton;
@property (weak, nonatomic) IBOutlet UIImageView *characterImageView;


@end
