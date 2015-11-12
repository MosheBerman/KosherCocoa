/**
 *  KCParashatHashavuaCalculator.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 1/17/11.
 *  Updated by Moshe Berman on 10/7/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "KCParashatHashavuaCalculator.h"
#import "KCConstants.h"

#define kOutOfRangeString @"[KosherCocoa] Error: Parsha out of range."

@interface KCParashatHashavuaCalculator ()

@property (nonatomic, strong) NSCalendar *gregorianCalendar;
@property (nonatomic, strong) NSCalendar *hebrewCalendar;

@end

@implementation KCParashatHashavuaCalculator

#pragma mark - Initializer

- (id)init
{
    self = [super init];
    if (self) {
        _gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        _hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
    }
    return self;
}

#pragma mark - Getting the Parasha 

- (KCParasha *)parashaInDiasporaForDate:(NSDate *)date
{
    return [self _parashaForDate:date inDiaspora:YES];
}

- (KCParasha *)parashaInIsraelForDate:(NSDate *)date
{
    return [self _parashaForDate:date inDiaspora:NO];
}

#pragma mark - Arrays of Parshiot

- (NSArray *)parshiotInDiasporaDuringYearType:(enum kHebrewYearType)typeOfYear
{    

    NSArray *parshiot;
    
    if (typeOfYear == kHebrewYearTypeA) //  Monday, 353, regular
    {
        parshiot = @[@(KCParashaVayeilech),
                     @(KCParashaHaazinu),
                     @(KCParashaSukkot3),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhelAndPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaPesach3),
                     @(KCParashaShemini),
                     @(KCParashaTazriaAndMetzora),
                     @(KCParashaAchareiMotAndKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBeharAndBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavimAndVayeilech)];
    }
    
    else if(typeOfYear == kHebrewYearTypeB) //  Shabbat, 353, regular
    {
        
        parshiot = @[@(KCParashaRoshHashana1),
                     @(KCParashaHaazinu),
                     @(KCParashaSukkot3),
                     @(KCParashaSheminiAtzeret),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhelAndPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(kCParashaPesach7),
                     @(KCParashaShemini),
                     @(KCParashaTazriaAndMetzora),
                     @(KCParashaAchareiMotAndKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBeharAndBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavim)];
    }
    
    //  Tuesday, 354, regular || Monday, 355, regular
    else if(typeOfYear == kHebrewYearTypeC || typeOfYear == kHebrewYearTypeE)
    {
        parshiot = @[@(KCParashaVayeilech),
                     @(KCParashaHaazinu),
                     @(KCParashaSukkot3),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhelAndPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaPesach3),
                     @(KCParashaShemini),
                     @(KCParashaTazriaAndMetzora),
                     @(KCParashaAchareiMotAndKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBeharAndBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaShavuot2),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukatAndBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavimAndVayeilech)];
    }
    
    //  Thursday, 354, regular
    else if(typeOfYear == kHebrewYearTypeD)
    {
        parshiot = @[@(KCParashaHaazinu),
                     @(KCParashaYomKippur),
                     @(KCParashaSukkot3),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhelAndPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaPesach1),
                     @(KCParashaPesach8),
                     @(KCParashaShemini),
                     @(KCParashaTazriaAndMetzora),
                     @(KCParashaAchareiMotAndKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBeharAndBechukotai),

                     @(KCParashaBamidbar),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavim)];
    }
    
    //  Thursday, 355, regular
    else if(typeOfYear == kHebrewYearTypeF)
    {
        parshiot = @[@(KCParashaHaazinu),
                     @(KCParashaYomKippur),
                     @(KCParashaSukkot3),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhel),
                     @(KCParashaPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaPesach3),
                     @(KCParashaShemini),
                     @(KCParashaTazriaAndMetzora),
                     @(KCParashaAchareiMotAndKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBeharAndBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavim)];
    }
    
    //  Shabbat, 355, regular
    else if(typeOfYear == kHebrewYearTypeG)
    {     
        parshiot = @[@(KCParashaRoshHashana1),
                     @(KCParashaHaazinu),
                     @(KCParashaSukkot1),
                     @(KCParashaSheminiAtzeret),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhelAndPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaPesach3),
                     @(KCParashaShemini),
                     @(KCParashaTazriaAndMetzora),
                     @(KCParashaAchareiMotAndKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBeharAndBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavimAndVayeilech)];
    }

    //  Monday, 383, leap
    else if(typeOfYear == kHebrewYearTypeH)
    {
        parshiot = @[@(KCParashaVayeilech),
                     @(KCParashaHaazinu),
                     @(KCParashaSukkot3),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhel),
                     @(KCParashaPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaShemini),
                     @(KCParashaTazria),
                     @(KCParashaMetzora),
                     @(KCParashaPesach3),
                     @(KCParashaAchareiMot),
                     @(KCParashaKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBehar),
                     @(KCParashaBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaShavuot2),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukatAndBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavimAndVayeilech)];
    }
    
    //  Thursday, 383, leap
    else if(typeOfYear == kHebrewYearTypeI)
    {        
        parshiot = @[@(KCParashaHaazinu),
                     @(KCParashaYomKippur),
                     @(KCParashaSukkot3),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhel),
                     @(KCParashaPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaShemini),
                     @(KCParashaTazria),
                     @(KCParashaMetzora),
                     @(KCParashaAchareiMot),
                     @(KCParashaPesach3),
                     @(KCParashaKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBehar),
                     @(KCParashaBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatot),
                     @(KCParashaMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavim)];
    }
    
    //  Monday, 385, leap ||  Tuesday, 384, leap
    else if((typeOfYear == kHebrewYearTypeL) || (typeOfYear == kHebrewYearTypeK))
    {
        
        
        parshiot = @[@(KCParashaVayeilech),
                     @(KCParashaHaazinu),
                     @(KCParashaSukkot3),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhel),
                     @(KCParashaPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaShemini),
                     @(KCParashaTazria),
                     @(KCParashaMetzora),
                     @(KCParashaPesach1),
                     @(KCParashaPesach8),
                     @(KCParashaAchareiMot),
                     @(KCParashaKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBehar),
                     @(KCParashaBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavim)];
    }
    
    //  Shabbat, 383, leap
    else if(typeOfYear == kHebrewYearTypeJ)
    {
        parshiot = @[@(KCParashaRoshHashana1),
                     @(KCParashaHaazinu),
                     @(KCParashaSukkot3),
                     @(KCParashaSheminiAtzeret),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhel),
                     @(KCParashaPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaShemini),
                     @(KCParashaTazria),
                     @(KCParashaMetzora),
                     @(KCParashaPesach3),
                     @(KCParashaAchareiMot),
                     @(KCParashaKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBehar),
                     @(KCParashaBechukotai),
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavimAndVayeilech)];
    }
    
    //  Thursday,   385, leap
    else if(typeOfYear == kHebrewYearTypeM)
    {
        parshiot = @[@(KCParashaHaazinu),
                     @(KCParashaYomKippur),
                     @(KCParashaSukkot3),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhel),
                     @(KCParashaPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaShemini),
                     @(KCParashaTazria),
                     @(KCParashaMetzora),
                     @(KCParashaAchareiMot),
                     @(KCParashaPesach3),
                     @(KCParashaKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBehar),
                     @(KCParashaBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatot),
                     @(KCParashaMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavimAndVayeilech)];
        
    }
    
    //  Shabbat, 385, leap
    if(typeOfYear == kHebrewYearTypeN)
    {   
        parshiot = @[@(KCParashaRoshHashana1),
                     @(KCParashaHaazinu),
                     @(KCParashaSukkot3),
                     @(KCParashaSheminiAtzeret),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhel),
                     @(KCParashaPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaShemini),
                     @(KCParashaTazria),
                     @(KCParashaMetzora),
                     @(KCParashaPesach3),
                     @(KCParashaAchareiMot),
                     @(KCParashaKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBehar),
                     @(KCParashaBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaShavuot2),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukatAndBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavimAndVayeilech)];
    }
    
    return parshiot;
}

- (NSArray *)parshiotInIsraelDuringYearType:(enum kHebrewYearType)typeOfYear
{
    NSArray *parshiot;
    
    if (typeOfYear == kHebrewYearTypeA) //  Monday, 353, regular
    {
        parshiot = @[@(KCParashaVayeilech),
                     @(KCParashaHaazinu),
                     @(KCParashaSukkot3),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @( KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhelAndPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaPesach3),
                     @(KCParashaShemini),
                     @(KCParashaTazriaAndMetzora),
                     @(KCParashaAchareiMotAndKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBeharAndBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavimAndVayeilech)];
    }
    
    else if(typeOfYear == kHebrewYearTypeB) //  Shabbat, 353, regular
    {
        
        parshiot = @[@(KCParashaRoshHashana1),
                     @(KCParashaHaazinu),
                     @(KCParashaSukkot3),
                     @(KCParashaSheminiAtzeret),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhelAndPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(kCParashaPesach7),
                     @(KCParashaShemini),
                     @(KCParashaTazriaAndMetzora),
                     @(KCParashaAchareiMotAndKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBeharAndBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavim)];
    }
    
    //  Tuesday, 354, regular || Monday, 355, regular
    else if(typeOfYear == kHebrewYearTypeC || typeOfYear == kHebrewYearTypeE)
    {
        parshiot = @[@(KCParashaVayeilech),
                     @(KCParashaHaazinu),
                     @(KCParashaSukkot3),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhelAndPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaPesach3),
                     @(KCParashaShemini),
                     @(KCParashaTazriaAndMetzora),
                     @(KCParashaAchareiMotAndKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBeharAndBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),              //  Diverge from diaspora here
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),          //   Converge with diaspora here
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavimAndVayeilech)];
    }
    
    //  Thursday, 354, regular
    else if(typeOfYear == kHebrewYearTypeD)
    {
        parshiot = @[@(KCParashaHaazinu),
                     @(KCParashaYomKippur),
                     @(KCParashaSukkot3),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhelAndPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaPesach1),
                     @(KCParashaShemini),                   //  Diverge from diaspora here
                     @(KCParashaTazriaAndMetzora),
                     @(KCParashaAchareiMotAndKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBehar),
                     @(KCParashaBechukotai),                //  Converge with diaspora here
                     
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavim)];
    }
    
    //  Thursday, 355, regular
    else if(typeOfYear == kHebrewYearTypeF)
    {
        parshiot = @[@(KCParashaHaazinu),
                     @(KCParashaYomKippur),
                     @(KCParashaSukkot3),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhel),
                     @(KCParashaPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaPesach3),
                     @(KCParashaShemini),
                     @(KCParashaTazriaAndMetzora),
                     @(KCParashaAchareiMotAndKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBeharAndBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavim)];
    }
    
    //  Shabbat, 355, regular
    else if(typeOfYear == kHebrewYearTypeG)
    {
        parshiot = @[@(KCParashaRoshHashana1),
                     @(KCParashaHaazinu),
                     @(KCParashaSukkot1),
                     @(KCParashaSheminiAtzeret),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhelAndPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaPesach3),
                     @(KCParashaShemini),
                     @(KCParashaTazriaAndMetzora),
                     @(KCParashaAchareiMotAndKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBeharAndBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavimAndVayeilech)];
    }
    
    //  Monday, 383, leap
    else if(typeOfYear == kHebrewYearTypeH)
    {
        parshiot = @[@(KCParashaVayeilech),
                     @(KCParashaHaazinu),
                     @(KCParashaSukkot3),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhel),
                     @(KCParashaPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaShemini),
                     @(KCParashaTazria),
                     @(KCParashaMetzora),
                     @(KCParashaPesach3),
                     @(KCParashaAchareiMot),
                     @(KCParashaKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBehar),
                     @(KCParashaBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),              //  Diverge from diaspora here
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),           //  Converge with diaspora here
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavimAndVayeilech)];
    }
    
    //  Thursday, 383, leap
    else if(typeOfYear == kHebrewYearTypeI)
    {
        parshiot = @[@(KCParashaHaazinu),
                     @(KCParashaYomKippur),
                     @(KCParashaSukkot3),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhel),
                     @(KCParashaPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaShemini),
                     @(KCParashaTazria),
                     @(KCParashaMetzora),
                     @(KCParashaAchareiMot),
                     @(KCParashaPesach3),
                     @(KCParashaKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBehar),
                     @(KCParashaBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatot),
                     @(KCParashaMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavim)];
    }
    
    //  Monday, 385, leap ||  Tuesday, 384, leap
    else if((typeOfYear == kHebrewYearTypeL) || (typeOfYear == kHebrewYearTypeK))
    {
        
        
        parshiot = @[@(KCParashaVayeilech),
                     @(KCParashaHaazinu),
                     @(KCParashaSukkot3),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhel),
                     @(KCParashaPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaShemini),
                     @(KCParashaTazria),
                     @(KCParashaMetzora),
                     @(KCParashaPesach1),
                     @(KCParashaAchareiMot),    //  Diverge from diaspora here
                     @(KCParashaKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBehar),
                     @(KCParashaBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatot),
                     @(KCParashaMasei),     //  Converge with diaspora here
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavim)];
    }
    
    //  Shabbat, 383, leap
    else if(typeOfYear == kHebrewYearTypeJ)
    {
        parshiot = @[@(KCParashaRoshHashana1),
                     @(KCParashaHaazinu),
                     @(KCParashaSukkot3),
                     @(KCParashaSheminiAtzeret),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhel),
                     @(KCParashaPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaShemini),
                     @(KCParashaTazria),
                     @(KCParashaMetzora),
                     @(KCParashaPesach3),
                     @(KCParashaAchareiMot),
                     @(KCParashaKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBehar),
                     @(KCParashaBechukotai),
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavimAndVayeilech)];
    }
    
    //  Thursday,   385, leap
    else if(typeOfYear == kHebrewYearTypeM)
    {
        parshiot = @[@(KCParashaHaazinu),
                     @(KCParashaYomKippur),
                     @(KCParashaSukkot3),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhel),
                     @(KCParashaPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaShemini),
                     @(KCParashaTazria),
                     @(KCParashaMetzora),
                     @(KCParashaAchareiMot),
                     @(KCParashaPesach3),
                     @(KCParashaKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBehar),
                     @(KCParashaBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),
                     @(KCParashaMatot),
                     @(KCParashaMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavimAndVayeilech)];
        
    }
    
    //  Shabbat, 385, leap
    if(typeOfYear == kHebrewYearTypeN)
    {
        parshiot = @[@(KCParashaRoshHashana1),
                     @(KCParashaHaazinu),
                     @(KCParashaSukkot3),
                     @(KCParashaSheminiAtzeret),
                     
                     @(KCParashaBereshit),
                     @(KCParashaNoach),
                     @(KCParashaLechLecha),
                     @(KCParashaVayeira),
                     @(KCParashaChayeiSarah),
                     @(KCParashaToldot),
                     @(KCParashaVayeitsei),
                     @(KCParashaVayishlach),
                     @(KCParashaVayeishev),
                     @(KCParashaMiketz),
                     @(KCParashaVayigash),
                     @(KCParashaVayechi),
                     
                     @(KCParashaShemot),
                     @(KCParashaVaera),
                     @(KCParashaBo),
                     @(KCParashaBeshalach),
                     @(KCParashaYitro),
                     @(KCParashaMishpatim),
                     @(KCParashaTerumah),
                     @(KCParashaTetzaveh),
                     @(KCParashaKiTissa),
                     @(KCParashaVayakhel),
                     @(KCParashaPekudei),
                     
                     @(KCParashaVayikra),
                     @(KCParashaTzav),
                     @(KCParashaShemini),
                     @(KCParashaTazria),
                     @(KCParashaMetzora),
                     @(KCParashaPesach3),
                     @(KCParashaAchareiMot),
                     @(KCParashaKedoshim),
                     @(KCParashaEmor),
                     @(KCParashaBehar),
                     @(KCParashaBechukotai),
                     
                     @(KCParashaBamidbar),
                     @(KCParashaNaso),              //  Diverge from diaspora here
                     @(KCParashaBehaalotecha),
                     @(KCParashaShelach),
                     @(KCParashaKorach),
                     @(KCParashaChukat),
                     @(KCParashaBalak),
                     @(KCParashaPinchas),           //  Converge with diaspora here
                     @(KCParashaMatotAndMasei),
                     
                     @(KCParashaDevarim),
                     @(KCParashaVaetchanan),
                     @(KCParashaEikev),
                     @(KCParashaReeh),
                     @(KCParashaShoftim),
                     @(KCParashaKiTeitzei),
                     @(KCParashaKiTavo),
                     @(KCParashaNitzavimAndVayeilech)];
    }
    
    return parshiot;
}

#pragma mark - Internal: Get a Parasha Object for a Date

//
//  Returns the correct parasha object
//

- (KCParasha *)_parashaForDate:(NSDate *)date inDiaspora:(BOOL)isInDiaspora
{
    
    date = [[self hebrewCalendar] lastDayOfTheWeekUsingReferenceDate:date];
    
    NSInteger year = [[self hebrewCalendar] yearsInDate:date];
    
    NSDate *roshHashana = [NSDate dateWithDay:1 Month:1 Year:year andCalendar:[self hebrewCalendar]];

    NSInteger weeksSinceRoshHashana = [[self hebrewCalendar] weeksFromDate:roshHashana toDate:date];
    
    enum kHebrewYearType type = [NSCalendar typeOfHebrewYearContainingDate:date];
    
	//
	//	Query the parshios
	//
	
	NSArray *parshiot = [self _parshiotForYearType:type inDiaspora:isInDiaspora];
    
    //
    //	Then look up this weeks parsha
    //
    
    NSNumber *parashaIDNumber = parshiot[weeksSinceRoshHashana];
    
    enum KCParashaIdentifier parashaID = [parashaIDNumber integerValue];
    
    KCParasha *parasha = [KCParasha parashaWithIdentifier:parashaID];
    
    return parasha;
}

#pragma mark - Parshiot For Year Type

- (NSArray *)_parshiotForYearType:(enum kHebrewYearType)type inDiaspora:(BOOL)diaspora;
{
    return  diaspora ? [self parshiotInDiasporaDuringYearType:type] : [self parshiotInIsraelDuringYearType:type];
}


@end