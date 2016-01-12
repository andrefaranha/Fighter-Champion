//
//  FighterManager.h
//  Fighter Champion
//
//  Created by Andre Aranha on 12/24/15.
//  Copyright © 2015 Andre Aranha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fighter.h"

@interface FighterManager : NSObject {
    
}

extern int const FIRST_ENEMY, SECOND_ENEMY, THIRD_ENEMY, FOURTH_ENEMY, FIFTH_ENEMY;

@property Fighter *fighter;
@property int currentEnemyId;

+(FighterManager *)getInstance;

-(void)createPlayerFighter;
-(Fighter *)getEnemyWithId:(int)enemyId;

-(BOOL)hasMoreEnemies;
-(void)nextEnemy;

-(void)reset;


@end