//
//  KCParasha.h
//  KosherCocoa
//
//  Created by Moshe Berman on 5/10/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import <Foundation/Foundation.h>

/* 

 This enum contains an identifier for each of the
 possible weekly readings. Double readings and holiday
 readings are treated seperately from "base" parshiot.
 
 */

typedef enum {
    KCParashaBereshit = 0,
    KCParashaNoach,
    KCParashaLechLecha,
    KCParashaVayeira,
    KCParashaToldot,
    KCParashaVayeitsei,
    KCParashaVayishlach,
    KCParashaVayeishev,
    KCParashaMiketz,
    KCParashaVayigash,
    KCParashaVayechi,
    KCParashaShemot,
    KCParashaVaera,
    KCParashaBo,
    KCParashaBeshalach,
    KCParashaYitro,
    KCParashaMishpatim,
    KCParashaTerumah,
    KCParashaTetzaveh,
    KCParashaKiTissa,
    KCParashaVayakhel,
    KCParashaPekudei,
    KCParashaVayikra,
    KCParashaTzav,
    KCParashaShemini,
    KCParashaTazria,
    KCParashaMetzora,
    KCParashaAchareiMot,
    KCParashaKedoshim,
    KCParashaEmor,
    KCParashaBehar,
    KCParashaBechukotai,
    KCParashaBamidbar,
    KCParashaNaso,
    KCParashaMehaalotcha,
    KCParashaShelach,
    KCParashaKorach,
    KCParashaChukat,
    KCParashaBalak,
    KCParashaPinchas,
    KCParashaMatot,
    KCParashaMasei,
    KCParashaDevarim,
    KCParashaVaetchanan,
    KCParashaEikev,
    KCParashaReeh,
    KCParashaShoftim,
    KCParashaKiTeitzei,
    KCParashaKiTavo,
    KCParashaNitzavim,
    KCParashaVayeilech,
    KCParashaHaazinu,
    KCParashaVezotHaberacha
} KCParashaIdentifier;

@interface KCParasha : NSObject

@property (nonatomic, assign) KCParashaIdentifier identifier;

- (NSString *)name;
- (NSString *)nameTransliterated;

@end
