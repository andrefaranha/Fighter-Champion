//
//  FighterManager.m
//  Fighter Champion
//
//  Created by Andre Aranha on 12/24/15.
//  Copyright © 2015 Andre Aranha. All rights reserved.
//

#import "FighterManager.h"

@implementation FighterManager

int const FIRST_ENEMY = 1,
          SECOND_ENEMY = 2,
          THIRD_ENEMY = 3,
          FOURTH_ENEMY = 4,
          FIFTH_ENEMY = 5,
          LAST_ENEMY = FIFTH_ENEMY;

static FighterManager *instance = nil;

+(FighterManager *)getInstance {
    if (instance == nil)
        instance = [[super alloc] init];
    return instance;
}

-(void)createPlayerFighter {
    Fighter *newFighter = [[Fighter alloc] init];
    [self setFighter:newFighter];
}

-(Fighter *)getEnemyWithId:(int)enemyId {
    Fighter *enemyFighter;
    switch (enemyId) {
        case FIRST_ENEMY:
            enemyFighter = [[Fighter alloc] initWithName:@"Nucky" maxHp:30 atk:5 def:3];
            [enemyFighter setImageFilename:@"003-Fighter03.png"];
            break;
        case SECOND_ENEMY:
            enemyFighter = [[Fighter alloc] initWithName:@"Masked Man" maxHp:50 atk:7 def:5];
            [enemyFighter setImageFilename:@"004-Fighter04.png"];
            break;
        case THIRD_ENEMY:
            enemyFighter = [[Fighter alloc] initWithName:@"Cat lady" maxHp:30 atk:5 def:3];
            [enemyFighter setImageFilename:@"007-Fighter07.png"];
            break;
        case FOURTH_ENEMY:
            enemyFighter = [[Fighter alloc] initWithName:@"The Force" maxHp:40 atk:6 def:4];
            [enemyFighter setImageFilename:@"006-Fighter06.png"];
            break;
        case FIFTH_ENEMY:
            enemyFighter = [[Fighter alloc] initWithName:@"Big Brother" maxHp:50 atk:7 def:5];
            [enemyFighter setImageFilename:@"005-Fighter05.png"];
            break;
    }
    
    return enemyFighter;
}

-(BOOL)hasMoreEnemies {
    return self.currentEnemyId < LAST_ENEMY;
}

-(void)nextEnemy {
    if (self.currentEnemyId < LAST_ENEMY)
        self.currentEnemyId++;
}

-(void)reset {
    self.fighter = nil;
    self.currentEnemyId = 0;
}

@end