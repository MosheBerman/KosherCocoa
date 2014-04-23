//
//  KCParashaReadings.h
//  KosherCocoa
//
//  Created by Moshe Berman on 10/11/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#ifndef KosherCocoa_KCParashaReadings_h
#define KosherCocoa_KCParashaReadings_h

/**
 
 This enum contains an identifier for each of the
 possible weekly readings. Double readings and holiday
 readings are treated seperately from single parasha readings.
 
 */

NS_ENUM(NSInteger, KCParashaIdentifier){
    KCParashaIdentifierBereshit = 0,
    KCParashaIdentifierNoach,
    KCParashaIdentifierLechLecha,
    KCParashaIdentifierVayeira,
    KCParashaIdentifierChayeiSarah,
    KCParashaIdentifierToldot,
    KCParashaIdentifierVayeitsei,
    KCParashaIdentifierVayishlach,
    KCParashaIdentifierVayeishev,
    KCParashaIdentifierMiketz,
    KCParashaIdentifierVayigash,
    KCParashaIdentifierVayechi,
    KCParashaIdentifierShemot,
    KCParashaIdentifierVaera,
    KCParashaIdentifierBo,
    KCParashaIdentifierBeshalach,
    KCParashaIdentifierYitro,
    KCParashaIdentifierMishpatim,
    KCParashaIdentifierTerumah,
    KCParashaIdentifierTetzaveh,
    KCParashaIdentifierTerumahAndTetzaveh,    //  Terumah - Tetzaveh
    KCParashaIdentifierKiTissa,
    KCParashaIdentifierVayakhel,
    KCParashaIdentifierPekudei,
    KCParashaIdentifierVayakhelAndPekudei,    //  Vayakhel - Pekudei
    KCParashaIdentifierVayikra,
    KCParashaIdentifierTzav,
    KCParashaIdentifierShemini,
    KCParashaIdentifierTazria,
    KCParashaIdentifierMetzora,
    KCParashaIdentifierTazriaAndMetzora,
    KCParashaIdentifierAchareiMot,
    KCParashaIdentifierKedoshim,
    KCParashaIdentifierAchareiMotAndKedoshim, //  Acharei - Kedoshim
    KCParashaIdentifierEmor,
    KCParashaIdentifierBehar,
    KCParashaIdentifierBechukotai,
    KCParashaIdentifierBeharAndBechukotai,    //  Behar - Bechukotai
    KCParashaIdentifierBamidbar,
    KCParashaIdentifierNaso,
    KCParashaIdentifierBehaalotecha,
    KCParashaIdentifierShelach,
    KCParashaIdentifierKorach,
    KCParashaIdentifierChukat,
    KCParashaIdentifierBalak,
    KCParashaIdentifierChukatAndBalak,        //  Chukat - Balak
    KCParashaIdentifierPinchas,
    KCParashaIdentifierMatot,
    KCParashaIdentifierMasei,
    KCParashaIdentifierMatotAndMasei,         //  Matot - Masei
    KCParashaIdentifierDevarim,
    KCParashaIdentifierVaetchanan,
    KCParashaIdentifierEikev,
    KCParashaIdentifierReeh,
    KCParashaIdentifierShoftim,
    KCParashaIdentifierKiTeitzei,
    KCParashaIdentifierKiTavo,
    KCParashaIdentifierNitzavim,
    KCParashaIdentifierVayeilech,
    KCParashaIdentifierNitzavimAndVayeilech,  //  Nitzavim - Vayeilech
    KCParashaIdentifierHaazinu,
    KCParashaIdentifierVezotHaberacha,
    KCParashaIdentifierRoshHashana1,  //  Rosh Hashana falls on Shabbat
    KCParashaIdentifierYomKippur,     //  Yom Kippur falls on Shabbat
    KCParashaIdentifierSukkot1,       //  Sukkot falls on Shabbat
    KCParashaIdentifierSukkot3,       //  Chol Hamoed Sukkot falls on Shabbat
    KCParashaIdentifierSheminiAtzeret,//  Shemini Atzeret falls on Shabbat
    KCParashaIdentifierPesach1,       //  The first night of pesach falls on Shabbat
    KCParashaIdentifierPesach3,       //  Chol Hamoed Pesach contains a Shabbat
    KCParashaIdentifierPesach7,       //  The 7th day of Pesach falls on Shabbat
    KCParashaIdentifierPesach8,       //  In diaspora, the 8th day of Pesach falls on Shabbat
    KCParashaIdentifierShavuot2,      //  The second day of Shavuot falls on Shabbat
};

#endif
