//
//  Fighter.h
//  Fighter Champion
//
//  Created by Andre Aranha on 12/24/15.
//  Copyright © 2015 Andre Aranha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fighter : NSObject {
}

@property (readonly) NSString *name;
@property (readonly) NSString *imageFilename;

@property (readonly) int maxHp, hp;
@property (readonly) int atk;
@property (readonly) int def;
@property (readonly) int pointsToDistribute;

@property BOOL defending;


-(id)initWithName:(NSString *)name maxHp:(int)maxHp atk:(int)atk def:(int)def;

-(void)setName:(NSString *)aName;
-(void)setImageFilename:(NSString *)aImageFilename;
-(void)setMaxHp:(int)aMaxHp;
-(void)setHp:(int)aHp;
-(void)setAtk:(int)aAtk;
-(void)setDef:(int)aDef;
-(void)setPointsToDistribute:(int)aPointsToDistribute;

-(void)incMaxHpBy:(int)inc;
-(void)incHpBy:(int)inc;
-(void)incAtkBy:(int)inc;
-(void)incDefBy:(int)inc;
-(void)incPointsToDistributeBy:(int)inc;

-(void)decMaxHpBy:(int)dec;
-(void)decHpBy:(int)dec;
-(void)decAtkBy:(int)dec;
-(void)decDefBy:(int)dec;
-(void)decPointsToDistributeBy:(int)dec;

-(void)recover;
-(void)clearStatus;

-(int)calcTotalDamageWithInitialDamage:(int)inicialDamage;
-(int)receiveDamageFromFighter:(int)initialDamage;
-(BOOL)isDead;

@end
