//
//  Battle.h
//  Fighter Champion
//
//  Created by Andre Aranha on 12/26/15.
//  Copyright © 2015 Andre Aranha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fighter.h"

@interface Battle : NSObject

@property Fighter *fighter, *enemy, *fighterInTurn;
@property BOOL gameRunning;

-(id)initWithFighter:(Fighter *)fighter andEnemy:(Fighter *)enemy;

-(Fighter *)getFighterNotInTurn;
-(void)changeFighterInTurn;
-(BOOL)isFighterInTurn:(Fighter *)figther;
-(void)endTurn;
-(void)endBattle;

//-(void)performAttackWithFighterInTurn;
-(void)attackFighterWithEnemy;
-(int)attackEnemy:(Fighter *)enemy withFighter:(Fighter *)fighter;

@end