/**
 *  KCParashaReadings.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 10/11/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#ifndef KosherCocoa_KCParashaReadings_h
#define KosherCocoa_KCParashaReadings_h

/**
 
 This enum contains an identifier for each of the
 possible weekly readings. Double readings and holiday
 readings are treated seperately from single parasha readings.
 
 */

typedef NS_ENUM(NSInteger, KCParashaIdentifier){
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
};


#endif
