//
//  Battle.m
//  Fighter Champion
//
//  Created by Andre Aranha on 12/26/15.
//  Copyright © 2015 Andre Aranha. All rights reserved.
//

#import "Battle.h"

@implementation Battle

-(id)initWithFighter:(Fighter *)fighter andEnemy:(Fighter *)enemy {
    self = [super init];
    if (self) {
        [self setFighter:fighter];
        [self setEnemy:enemy];
        
        [self.fighter recover];
        [self.enemy recover];
        
        [self setFighterInTurn:[self fighter]];
        
        [self setGameRunning:YES];
    }
    return self;
}


-(Fighter *)getFighterNotInTurn {
    if ([self fighterInTurn] == [self fighter])
        return [self enemy];
    return [self fighter];
}

-(void)changeFighterInTurn {
    [self setFighterInTurn:[self getFighterNotInTurn]];
}

-(BOOL)isFighterInTurn:(Fighter *)figther {
    return [self fighterInTurn] == figther;
}

-(void)endTurn {
    if ([[self fighterInTurn] isDead] || [[self getFighterNotInTurn] isDead])
        [self endBattle];
    else
        [self changeFighterInTurn];
    [[self fighterInTurn] clearStatus];
}

-(void)endBattle {
    [self setGameRunning:NO];
}


-(void)attackFighterWithEnemy {
    [self attackEnemy:[self fighter] withFighter:[self enemy]];
}

-(int)attackEnemy:(Fighter *)enemy withFighter:(Fighter *)fighter {
    return [enemy receiveDamageFromFighter:[fighter atk]];
}

@end