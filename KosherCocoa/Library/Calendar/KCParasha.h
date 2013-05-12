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
 readings are treated seperately from single parasha readings.
 
 */

typedef enum {
    KCParashaBereshit = 0,
    KCParashaNoach,
    KCParashaLechLecha,
    KCParashaVayeira,
    KCParashaChayeiSarah,
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
    KCParashaTerumahAndTetzaveh,    //  Terumah - Tetzaveh
    KCParashaKiTissa,
    KCParashaVayakhel,
    KCParashaPekudei,
    KCParashaVayakhelAndPekudei,    //  Vayakhel - Pekudei
    KCParashaVayikra,
    KCParashaTzav,
    KCParashaShemini,
    KCParashaTazria,
    KCParashaMetzora,
    KCParashaTazriaAndMetzora,
    KCParashaAchareiMot,
    KCParashaKedoshim,
    KCParashaAchareiMotAndKedoshim, //  Acharei - Kedoshim
    KCParashaEmor,
    KCParashaBehar,
    KCParashaBechukotai,
    KCParashaBeharAndBechukotai,    //  Behar - Bechukotai
    KCParashaBamidbar,
    KCParashaNaso,
    KCParashaBehaalotecha,
    KCParashaShelach,
    KCParashaKorach,
    KCParashaChukat,
    KCParashaBalak,
    KCParashaChukatAndBalak,        //  Chukat - Balak
    KCParashaPinchas,
    KCParashaMatot,
    KCParashaMasei,
    KCParashaMatotAndMasei,         //  Matot - Masei
    KCParashaDevarim,
    KCParashaVaetchanan,
    KCParashaEikev,
    KCParashaReeh,
    KCParashaShoftim,
    KCParashaKiTeitzei,
    KCParashaKiTavo,
    KCParashaNitzavim,
    KCParashaVayeilech,
    KCParashaNitzavimAndVayeilech,  //  Nitzavim - Vayeilech
    KCParashaHaazinu,
    KCParashaVezotHaberacha,
    KCParashaRoshHashana1,  //  Rosh Hashana falls on Shabbat
    KCParashaYomKippur,     //  Yom Kippur falls on Shabbat
    KCParashaSukkot1,       //  Sukkot falls on Shabbat
    KCParashaSukkot3,       //  Chol Hamoed Sukkot falls on Shabbat
    KCParashaSheminiAtzeret,//  Shemini Atzeret falls on Shabbat
    KCParashaPesach1,       //  The first night of pesach falls on Shabbat
    KCParashaPesach3,       //  Chol Hamoed Pesach contains a Shabbat
    kCParashaPesach7,       //  The 7th day of Pesach falls on Shabbat
    KCParashaPesach8,       //  In diaspora, the 8th day of Pesach falls on Shabbat
    KCParashaShavuot2,      //  The second day of Shavuot falls on Shabbat
} KCParashaIdentifier;

@interface KCParasha : NSObject

@property (nonatomic, assign) KCParashaIdentifier identifier;

- (id)initWithIdentifier:(KCParashaIdentifier)identifier;
+ (id)parashaWithIdentifier:(KCParashaIdentifier)identifier;

- (NSString *)name; //  The hebrew name of the parasha
- (NSString *)nameTransliterated;   //  The name of the parasha, transliterated into English

@end
