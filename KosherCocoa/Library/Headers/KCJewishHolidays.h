/**
 *  KCJewishHolidays.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 8/25/13.
 *  Updated by Moshe Berman on 10/11/13.
 *  
 *  The Jewish holidays, called "Yomim Tovim", or "Chagim",
 *  are defined here.
 *
 *  This includes the major historical holidays,
 *  and the modern holidays, instituted in relation to
 *  the establishment of the State of Israel, in 1948.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#ifndef __KC_JEWISH_HOLIDAYS_H
#define __KC_JEWISH_HOLIDAYS_H

/** kYomimTovim
 *
 *  Jewish holidays (and their "eve"s), including:
 *
 *  The three primary holidays: 
 *  - Pesach
 *  - Shavuot
 *  - Sukkot
 *
 *  Secondary or rabinically instituted holidays:
 *
 *  - Purim, Shushan Purim, and Purim Katan
 *  - Chanukah
 *  - Rosh Chodesh (The new moon)
 *
 *  Fast Days
 *  - Yom Kippur
 *  - Seventeenth of Tammuz
 *  - Ninth of Av
 *  - Fast of Gedalya
 *  - Tenth of Tevet
 *  - Fast of Esther
 *
 *  Zionist Holidays
 *  - Yom Hashoah (Holocaust Memorial Day)
 *  - Yom Hazikaron (Memorial Day)
 *  - Yom Haatzmaut (Independence Day)
 *  - Yom Yerushalayim (Jerusalem Day)
 *
 *  Take a look at the enum for the ones that aren't included.
 */

//  TODO: Make these into bitwise values so we can mask them. 

enum kYomimTovim {
    kErevPesach = 0,
    kPesach,
    kCholHamoedPesach,
    kPesachSheni,
    kErevShavuos,
    kShavuos,
    kSeventeenthOfTammuz,
    kTishaBeav, //  TODO: Change to NinthOfAv to match convention of others
    kTuBeav,
    kErevRoshHashana,
    kRoshHashana,
    kFastOfGedalya,
    kErevYomKippur,
    kYomKippur,
    kErevSuccos,
    kSuccos,
    kCholHamoedSuccos,
    kHoshanaRabba,
    kSheminiAtzeres,
    kSimchasTorah,
    kErevChanukah,
    kChanukah,
    kTenthOfTeves,  //  TODO: Change "Teves" to "tevet"
    kTuBeshvat,
    kFastOfEsther,
    kPurim,
    kShushanPurim,
    kPurimKatan,
    kRoshChodesh,
    kYomHashoah,
    kYomHazikaron,
    kYomHaatzmaut,
    kYomYerushalayim
};


#endif // __KC_JEWISH_HOLIDAYS_H