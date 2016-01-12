//
//  Fighter.m
//  Fighter Champion
//
//  Created by Andre Aranha on 12/24/15.
//  Copyright © 2015 Andre Aranha. All rights reserved.
//

#import "Fighter.h"

@implementation Fighter

@synthesize name = _name;
@synthesize imageFilename = _imageFilename;
@synthesize maxHp = _maxHp;
@synthesize hp = _hp;
@synthesize atk = _atk;
@synthesize def = _def;
@synthesize pointsToDistribute = _pointsToDistribute;

-(id)init {
    self = [super init];
    
    if (self) {
        [self setMaxHp:1];
        [self clearStatus];
    }
    
    return self;
}

-(id)initWithName:(NSString *)aName maxHp:(int)aMaxHp atk:(int)aAtk def:(int)aDef {
    if (self = [super init]) {
        [self setName:aName];
        [self setMaxHp:aMaxHp];
        [self setAtk:aAtk];
        [self setDef:aDef];
        [self setPointsToDistribute:0];
    }
    return self;
}

-(void)setName:(NSString *)aName {
    _name = aName;
}

-(void)setImageFilename:(NSString *)aImageFilename {
    _imageFilename = aImageFilename;
}

-(void)setMaxHp:(int)aMaxHp {
    _maxHp = fmax(1, aMaxHp);
}

-(void)setHp:(int)aHp {
    aHp = fmin(aHp, self.maxHp);
    aHp = fmax(aHp, 0);
    _hp = aHp;
}

-(void)setAtk:(int)aAtk {
    _atk = fmax(aAtk, 0);
}

-(void)setDef:(int)aDef {
    _def = fmax(aDef, 0);
}

-(void)setPointsToDistribute:(int)aPointsToDistribute {
    _pointsToDistribute = aPointsToDistribute;
}


-(void)incMaxHpBy:(int)inc {
    [self setMaxHp:(self.maxHp + inc)];
}

-(void)incHpBy:(int)inc {
    [self setHp:(self.hp + inc)];
}

-(void)incAtkBy:(int)inc {
    [self setAtk:(self.atk + inc)];
}

-(void)incDefBy:(int)inc {
    [self setDef:(self.def + inc)];
}

-(void)incPointsToDistributeBy:(int)inc {
    [self setPointsToDistribute:(self.pointsToDistribute + inc)];
}


-(void)decMaxHpBy:(int)dec {
    [self setMaxHp:(self.maxHp - dec)];
}

-(void)decHpBy:(int)dec {
    [self setHp:(self.hp - dec)];
}

-(void)decAtkBy:(int)dec {
    [self setAtk:(self.atk - dec)];
}

-(void)decDefBy:(int)dec {
    [self setDef:(self.def - dec)];
}

-(void)decPointsToDistributeBy:(int)dec {
    [self setPointsToDistribute:(self.pointsToDistribute - dec)];
}


-(void)recover {
    self.hp = self.maxHp;
}

-(void)clearStatus {
    [self setDefending:NO];
}


-(int)calcTotalDamageWithInitialDamage:(int)inicialDamage; {
    int totalDamage = fmax(inicialDamage - [self def], 1);
    if ([self defending])
        totalDamage /= 2;
    
    return totalDamage;
}

-(int)receiveDamageFromFighter:(int)initialDamage {
    int damage = [self calcTotalDamageWithInitialDamage:initialDamage];
    [self decHpBy:damage];
    
    return damage;
}

-(BOOL)isDead {
    return [self hp] == 0;
}


-(NSString *)description {
    return [NSString stringWithFormat:@"%@", [self name]];
}

@end
