//
//  WeeklyParsha.m
//  ParshaPort
//
//  Created by Moshe Berman on 1/17/11.
//  Copyright 2011 MosheBerman.com. All rights reserved.
//

#import "ParashatHashavua.h"
#import "KosherCocoaConstants.h"

#define kOutOfRangeString @"[KosherCocoa] Error: Parsha out of range."

@interface ParashatHashavua ()

//
//  Determine if a given Hebrew year is a leap year
//

- (BOOL)_isHebrewLeapYear:(NSInteger)year;

//
// These two methods produce an array of parshiot for a given an array with year information
//

- (NSMutableArray *)_parshiotForDiasporaDuringYearType:(kHebrewYearType)typeOfYear;
- (NSMutableArray *)_parshiotForIsraelDuringYearType:(kHebrewYearType)typeOfYear;

/*  Utility functions that manipulate the original array */

- (NSMutableArray *)addParsha:(NSArray *)parsha toMutableArray:(NSMutableArray *)mutableArray;
- (NSMutableArray *)insertParsha:(NSArray *)parsha intoMutableArray:(NSMutableArray *)mutableArray atIndex:(NSUInteger)index;
- (NSMutableArray *)combineParshiosStartingAtIndex:(NSUInteger)index fromArray:(NSMutableArray *)mutableArray;

//  A hebrew calendar instance
@property (nonatomic, strong) NSCalendar *hebrewCalendar;
@property (nonatomic, strong) NSCalendar *gregorianCalendar;
@property (nonatomic, strong) NSMutableArray *parshiot;

@end

@implementation ParashatHashavua

//A delimiter for parsha combinations
#define kDelimiter @"-"

- (id)init
{
    self = [super init];
    
	if (self)
    {
        _useHebrewNames = YES;
        
        _hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSHebrewCalendar];
        _gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
        _parshiot = [@[@[@"Bereshit", @"בראשית"],
                     @[@"Noach", @"נח"],
                     @[@"Lech Lecha", @"לך לך"],
                     @[@"Vayeira", @"וירא"],
                     @[@"Chayei Sarah", @"חיי שרה"],
                     @[@"Toldot", @"תולדות"],
                     @[@"Vayeitsei", @"ויצא"],
                     @[@"Vayishlach", @"וישלח"],
                     @[@"Vayeishev", @"וישב"],
                     @[@"Miketz", @"מקץ"],
                     @[@"Vayigash", @"ויגש"],
                     @[@"Vayechi", @"ויחי"],
                     @[@"Shemot", @"שמות"],
                     @[@"Va'era", @"וארא"],
                     @[@"Bo", @"בא"],
                     @[@"Beshalach", @"בשלח"],
                     @[@"Yitro", @"יתרו"],
                     @[@"Mishpatim", @"משפטים"],
                     @[@"Terumah", @"תרומה"],
                     @[@"Tetzaveh", @"תצוה"],
                     @[@"Ki Tissa", @"כי תשא"],
                     @[@"Vayakhel", @"ויקהל"],
                     @[@"Pekudei", @"פקודי"],
                     @[@"Vayikra", @"ויקרא"],
                     @[@"Tzav", @"צו"],
                     @[@"Shemini", @"שמיני"],
                     @[@"Tazria", @"תזריע"],
                     @[@"Metzora", @"מצורע"],
                     @[@"Acharei Mot", @"אחרי מות"],
                     @[@"Kedoshim", @"קדושים"],
                     @[@"Emor", @"אמור"],
                     @[@"Behar", @"בהר"],
                     @[@"Bechukotai", @"בחקתי"],
                     @[@"Bemidbar", @"במדבר"],
                     @[@"Naso", @"נשא"],
                     @[@"Beha'alotcha", @"בהעלותך"],
                     @[@"Shelach", @"שלח"],
                     @[@"Korach", @"קרח"],
                     @[@"Chukat", @"חקת"],
                     @[@"Balak", @"בלק"],
                     @[@"Pinchas", @"פינחס"],
                     @[@"Matot", @"מטות"],
                     @[@"Masei", @"מסעי"],
                     @[@"Devarim", @"דברים"],
                     @[@"Va'etchanan", @"ואתחנן"],
                     @[@"Eikev", @"עקב"],
                     @[@"Re'eh", @"ראה"],
                     @[@"Shoftim", @"שופטים"],
                     @[@"Ki Teitzei", @"כי תצא"],
                     @[@"Ki Tavo", @"כי תבוא"],
                     @[@"Nitzavim", @"נצבים"],
                     @[@"Vayeilech", @"וילך"],
                     @[@"Ha'azinu", @"האזינו"],
                     @[@"Vezot Haberacha", @"וזאת הברכה"]]
                     mutableCopy];    
	}
	
	return self;
}

#pragma mark psh

- (NSMutableArray *)addParsha:(NSArray *)parsha toMutableArray:(NSMutableArray *)mutableArray
{
	[mutableArray insertObject:parsha atIndex:0];
	
	return mutableArray;
}

#pragma mark - Padd


- (NSMutableArray *)insertParsha:(NSString *)parsha intoMutableArray:(NSMutableArray *)mutableArray atIndex:(NSUInteger)index
{
	[mutableArray insertObject:parsha atIndex:index];
	return mutableArray;
}

#pragma mark -  Pcom

- (NSMutableArray *)combineParshiosStartingAtIndex:(NSUInteger)index fromArray:(NSMutableArray *)mutableArray
{
	NSString *delimiter = kDelimiter;
	
    NSString *hebrewString = [NSString stringWithFormat:@"%@%@%@",mutableArray[index][1],delimiter,mutableArray[index+1][1]];
    NSString *englishString = [NSString stringWithFormat:@"%@%@%@",mutableArray[index][0],delimiter,mutableArray[index+1][0]];
	mutableArray[index] = @[englishString, hebrewString];
	[mutableArray removeObjectAtIndex:index+1];
	
	return mutableArray;
}

#pragma mark - parshaParse

- (NSMutableArray *)_parshiotForDiasporaDuringYearType:(kHebrewYearType)typeOfYear
{
	//
	//	A copy of the parshios array
	//
	
	NSMutableArray *tempArray = [[self parshiot] mutableCopy];
	
	//
	//	How many times we combined the parshios already
	//
	
	NSInteger combinations = 0;
    
    //
    
    
    if (typeOfYear == kHebrewYearTypeA)
    {
        
        //
        //  Combine the necessary parshios
        //
        
        [self combineParshiosStartingAtIndex:21 fromArray:tempArray];
        combinations++;
        
        //
        //  Insert Holidays
        //
        
        tempArray = [self insertParsha:@[@"Chol Hamoed Pesach", @"חוה\"מ פסח"] intoMutableArray:tempArray atIndex:25-1];
        
        //
        //  Add parshios to the begining of the year
        //
        
        [self addParsha:@[@"Chol Hamoed Sukkot", @"חוה\"מ סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        [self addParsha:@[@"Vayeilech", @"וילך"] toMutableArray:tempArray];
    }
    
    else if(typeOfYear == kHebrewYearTypeB)
    {
        
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:21 fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:26-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:28-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:31-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:38-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:41-combinations fromArray:tempArray];
        
        //
        //  Insert Pesach
        //
        
        tempArray = [self insertParsha:@[@"Pesach 7", @"ז' פסח"] intoMutableArray:tempArray atIndex:25-1];
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Shmini Atzeret", @"שמיני עצרת"] toMutableArray:tempArray];
        [self addParsha:@[@"Sukkot 1", @"א' סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        [self addParsha:@[@"Rosh Hashana 1", @"א' ראש השנה"] toMutableArray:tempArray];
        
    }
    
    else if(typeOfYear == kHebrewYearTypeC || typeOfYear == kHebrewYearTypeE)
    {
        
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:21 fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:26-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:28-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:31-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:38-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:41-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:50-combinations fromArray:tempArray];
        
        //
        //  Insert Chol Hamoed
        //
        
        tempArray = [self insertParsha:@[@"Chol Hamoed Pesach", @"חוה\"מ פסח"] intoMutableArray:tempArray atIndex:25-1];
        tempArray = [self insertParsha:@[@"Shavuot 2" , @"ב' שבועות"] intoMutableArray:tempArray atIndex:32-1];
        
        //
        //  Add parshios to the begining of the year
        //
        
        [self addParsha:@[@"Chol Hamoed Sukkot", @"חוה\"מ סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        [self addParsha:@[@"Vayeilech", @"וילך"] toMutableArray:tempArray];
        
    }
    
    else if(typeOfYear == kHebrewYearTypeD)
    {
        
        combinations = 0;
        
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:21 fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:26-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:28-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:31-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:41-combinations fromArray:tempArray];
        
        //
        //  Insert Pesach
        //
        
        tempArray = [self insertParsha:@[@"Pesach 1", @"א' פסח"] intoMutableArray:tempArray atIndex:25-1];
        tempArray = [self insertParsha:@[@"Pesach 8", @"ח' פסח"] intoMutableArray:tempArray atIndex:26-1];
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Chol Hamoed Sukkot", @"חוה\"מ סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Yom Kippur", @"יום כיפור"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
    }
    
    else if(typeOfYear == kHebrewYearTypeF)
    {
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:26 fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:28-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:31-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:41-combinations fromArray:tempArray];
        
        //
        //  Insert Pesach
        //
        
        tempArray = [self insertParsha:@[@"Pesach 7", @"ז' פסח"] intoMutableArray:tempArray atIndex:26-1];
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Chol Hamoed Sukkot", @"חוה\"מ סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Yom Kippur", @"יום כיפור"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        
    }
    
    else if(typeOfYear == kHebrewYearTypeG)
    {
        
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:21 fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:26-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:28-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:31-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:38-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:41-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:50-combinations fromArray:tempArray];
        
        //
        //  Insert Pesach
        //
        
        tempArray = [self insertParsha:@[@"Chol Hamoed Pesach", @"חוה\"מ פסח"] intoMutableArray:tempArray atIndex:25-1];
        
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Shmini Atzeret", @"שמיני עצרת"] toMutableArray:tempArray];
        [self addParsha:@[@"Sukkot 1", @"א' סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        [self addParsha:@[@"Rosh Hashana 1", @"א' ראש השנה"] toMutableArray:tempArray];
    }
    
    else if(typeOfYear == kHebrewYearTypeH)
    {
        
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:38 fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:41-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:50-combinations fromArray:tempArray];
        
        //
        //  Insert Pesach and Shavuos
        //
        
        tempArray = [self insertParsha:@[@"Chol Hamoed Pesach", @"חוה\"מ פסח"] intoMutableArray:tempArray atIndex:29-1];
        tempArray = [self insertParsha:@[@"Shavuot 2" , @"ב' שבועות"] intoMutableArray:tempArray atIndex:36-1];
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Chol Hamoed Sukkot", @"חוה\"מ סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        [self addParsha:@[@"Vayeilech", @"וילך"] toMutableArray:tempArray];
        
    }
    
    else if(typeOfYear == kHebrewYearTypeI)
    {
        
        //
        //  Insert Chol Hamoed
        //
        
        tempArray = [self insertParsha:@[@"Chol Hamoed Pesach", @"חוה\"מ פסח"] intoMutableArray:tempArray atIndex:30-1];
        
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Chol Hamoed Sukkot", @"חוה\"מ סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Yom Kippur", @"יום כיפור"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        
    }
    
    else if((typeOfYear == kHebrewYearTypeL)||(typeOfYear == kHebrewYearTypeK))
    {
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:41 fromArray:tempArray];
        
        //
        //  Insert Chol Hamoed
        //
        
        tempArray = [self insertParsha:@[@"Pesach 1", @"א' פסח"] intoMutableArray:tempArray atIndex:29-1];
        tempArray = [self insertParsha:@[@"Pesach 8", @"ח' פסח"] intoMutableArray:tempArray atIndex:30-1];
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Chol Hamoed Sukkot", @"חוה\"מ סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        [self addParsha:@[@"Vayeilech", @"וילך"] toMutableArray:tempArray];
        
    }
    
    else if(typeOfYear == kHebrewYearTypeJ)
    {
        
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:41 fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:50-combinations fromArray:tempArray];
        
        //
        //  Insert Chol Hamoed
        //
        
        tempArray = [self insertParsha:@[@"Chol Hamoed Pesach", @"חוה\"מ פסח"] intoMutableArray:tempArray atIndex:29-1];
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Shmini Atzeret", @"שמיני עצרת"] toMutableArray:tempArray];
        [self addParsha:@[@"Sukkot 1", @"א' סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        [self addParsha:@[@"Rosh Hashana 1", @"א' ראש השנה"] toMutableArray:tempArray];
    }
    
    else if(typeOfYear == kHebrewYearTypeM)
    {
        
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:50 fromArray:tempArray];
        
        //
        //  Insert Chol Hamoed
        //
        
        tempArray = [self insertParsha:@[@"Chol Hamoed Pesach", @"חוה\"מ פסח"] intoMutableArray:tempArray atIndex:30-1];
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Chol Hamoed Sukkot", @"חוה\"מ סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Yom Kippur", @"יום כיפור"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        
    }
    
    if(typeOfYear == kHebrewYearTypeN)
    {
        
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:38 fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:41-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:50-combinations fromArray:tempArray];
        
        //
        //  Insert Pesach and Shavuos
        //
        
        tempArray = [self insertParsha:@[@"Chol Hamoed Pesach", @"חוה\"מ פסח"] intoMutableArray:tempArray atIndex:29-1];
        tempArray = [self insertParsha:@[@"Shavuot 2", @"ב' שבועות"] intoMutableArray:tempArray atIndex:36-1];
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Shmini Atzeret", @"שמיני עצרת"] toMutableArray:tempArray];
        [self addParsha:@[@"Sukkot 1", @"א' סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        [self addParsha:@[@"Rosh Hashana 1", @"א' ראש השנה"] toMutableArray:tempArray];
    }
    
    return tempArray;
    
}

- (NSMutableArray *)_parshiotForIsraelDuringYearType:(kHebrewYearType)typeOfYear
{
	
	//
	//	A copy of the parshios array
	//
	
	NSMutableArray *tempArray = [[self parshiot] mutableCopy];
	
	//
	//	How many times we combined the parshios already
	//
	
	NSInteger combinations = 0;
    
    if (typeOfYear == kHebrewYearTypeA)
    {
        
        //
        //  Combine the necessary parshios
        //
        
        [self combineParshiosStartingAtIndex:21 fromArray:tempArray];
        combinations++;
        
        //
        //  Insert Holidays
        //
        
        tempArray = [self insertParsha:@[@"Chol Hamoed Pesach", @"חוה\"מ פסח"] intoMutableArray:tempArray atIndex:25-1];
        
        //
        //  Add parshios to the begining of the year
        //
        
        [self addParsha:@[@"Chol Hamoed Sukkot", @"חוה\"מ סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        [self addParsha:@[@"Vayeilech", @"וילך"] toMutableArray:tempArray];
    }
    
    else if(typeOfYear == kHebrewYearTypeB)
    {
        
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:21 fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:26-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:28-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:31-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:38-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:41-combinations fromArray:tempArray];
        
        //
        //  Insert Pesach
        //
        
        tempArray = [self insertParsha:@[@"Pesach 7", @"ז' פסח"] intoMutableArray:tempArray atIndex:25-1];
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Shmini Atzeret", @"שמיני עצרת"] toMutableArray:tempArray];
        [self addParsha:@[@"Sukkot 1", @"א' סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        [self addParsha:@[@"Rosh Hashana 1", @"א' ראש השנה"] toMutableArray:tempArray];
        
    }
    
    else if((typeOfYear == kHebrewYearTypeC) || ( typeOfYear == kHebrewYearTypeE))
    {
        
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:21 fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:26-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:28-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:31-combinations fromArray:tempArray];
        combinations++;
        //[self combineParshiosFromIndex:38-combinations fromMutableArray:tempArray];
        //combinations++;
        [self combineParshiosStartingAtIndex:41-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:50-combinations fromArray:tempArray];
        
        //
        //  Insert Chol Hamoed
        //
        
        tempArray = [self insertParsha:@[@"Chol Hamoed Pesach", @"חוה\"מ פסח"] intoMutableArray:tempArray atIndex:25-1];
        
        //
        //  Add parshios to the begining of the year
        //
        
        [self addParsha:@[@"Chol Hamoed Sukkot", @"חוה\"מ סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        [self addParsha:@[@"Vayeilech", @"וילך"] toMutableArray:tempArray];
        
    }
    
    else if(typeOfYear == kHebrewYearTypeD)
    {
        
        combinations = 0;
        
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:21 fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:26-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:28-combinations fromArray:tempArray];
        combinations++;
        // [self combineParshiosFromIndex:31-combinations fromMutableArray:tempArray];
        // combinations++;
        [self combineParshiosStartingAtIndex:41-combinations fromArray:tempArray];
        
        //
        //  Insert Pesach
        //
        
        tempArray = [self insertParsha:@[@"Pesach 1", @"א' פסח"] intoMutableArray:tempArray atIndex:25-1];
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Chol Hamoed Sukkot", @"חוה\"מ סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Yom Kippur", @"יום כיפור"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
    }
    
    else if(typeOfYear == kHebrewYearTypeF)
    {
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:26 fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:28-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:31-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:41-combinations fromArray:tempArray];
        
        //
        //  Insert Pesach
        //
        
        tempArray = [self insertParsha:@[@"Pesach 7", @"ז' פסח"] intoMutableArray:tempArray atIndex:26-1];
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Chol Hamoed Sukkot", @"חוה\"מ סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Yom Kippur", @"יום כיפור"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        
    }
    
    else if(typeOfYear == kHebrewYearTypeG)
    {
        
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:21 fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:26-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:28-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:31-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:38-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:41-combinations fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:50-combinations fromArray:tempArray];
        
        
        //
        //  Insert Pesach
        //
        
        tempArray = [self insertParsha:@[@"Chol Hamoed Pesach", @"חוה\"מ פסח"] intoMutableArray:tempArray atIndex:25-1];
        
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Shmini Atzeret", @"שמיני עצרת"] toMutableArray:tempArray];
        [self addParsha:@[@"Sukkot 1", @"א' סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        [self addParsha:@[@"Rosh Hashana 1", @"א' ראש השנה"] toMutableArray:tempArray];
    }
    
    else if(typeOfYear == kHebrewYearTypeH)
    {
        
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:41 fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:50-combinations fromArray:tempArray];
        
        
        //
        //  Insert Pesach and Shavuos
        //
        
        tempArray = [self insertParsha:@[@"Chol Hamoed Pesach", @"חוה\"מ פסח"] intoMutableArray:tempArray atIndex:29-1];
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Chol Hamoed Sukkot", @"חוה\"מ סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        [self addParsha:@[@"Vayeilech", @"וילך"] toMutableArray:tempArray];
        
    }
    
    else if(typeOfYear == kHebrewYearTypeI)
    {
        
        //
        //  Insert Chol Hamoed
        //
        
        tempArray = [self insertParsha:@[@"Chol Hamoed Pesach", @"חוה\"מ פסח"] intoMutableArray:tempArray atIndex:30-1];
        
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Chol Hamoed Sukkot", @"חוה\"מ סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Yom Kippur", @"יום כיפור"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        
    }
    
    else if(typeOfYear == kHebrewYearTypeJ)
    {
        
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:41 fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:50-combinations fromArray:tempArray];
        
        //
        //  Insert Chol Hamoed
        //
        
        tempArray = [self insertParsha:@[@"Chol Hamoed Pesach", @"חוה\"מ פסח"] intoMutableArray:tempArray atIndex:29-1];
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Shmini Atzeret", @"שמיני עצרת"] toMutableArray:tempArray];
        [self addParsha:@[@"Sukkot 1", @"א' סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        [self addParsha:@[@"Rosh Hashana 1", @"א' ראש השנה"] toMutableArray:tempArray];
    }
    
    else if((typeOfYear == kHebrewYearTypeL) || (typeOfYear == kHebrewYearTypeK))
    {
        
        //
        //  We don't double any parshiot in Israel this year!
        //
        
        //
        //  Insert Chol Hamoed
        //
        
        tempArray = [self insertParsha:@[@"Pesach 1", @"א' פסח"] intoMutableArray:tempArray atIndex:29-1];
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Chol Hamoed Sukkot", @"חוה\"מ סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        [self addParsha:@[@"Vayeilech", @"וילך"] toMutableArray:tempArray];
        
    }
    
    else if(typeOfYear == kHebrewYearTypeM)
    {
        
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:50 fromArray:tempArray];
        
        //
        //  Insert Chol Hamoed
        //
        
        tempArray = [self insertParsha:@[@"Chol Hamoed Pesach", @"חוה\"מ פסח"] intoMutableArray:tempArray atIndex:30-1];
        
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Chol Hamoed Sukkot", @"חוה\"מ סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Yom Kippur", @"יום כיפור"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        
    }
    
    if(typeOfYear == kHebrewYearTypeN)
    {
        
        //
        //  A test year would be 1929
        //
        
        //
        //  Double up the parshios
        //
        
        [self combineParshiosStartingAtIndex:41 fromArray:tempArray];
        combinations++;
        [self combineParshiosStartingAtIndex:50-combinations fromArray:tempArray];
        
        //
        //  Insert Pesach
        //
        
        tempArray = [self insertParsha:@[@"Chol Hamoed Pesach", @"חוה\"מ פסח"] intoMutableArray:tempArray atIndex:29-1];
        
        
        //
        //  Add parshios and holidays to the begining of the year
        //
        
        [self addParsha:@[@"Shmini Atzeret", @"שמיני עצרת"] toMutableArray:tempArray];
        [self addParsha:@[@"Sukkot 1", @"א' סוכות"] toMutableArray:tempArray];
        [self addParsha:@[@"Ha'azinu", @"האזינו"] toMutableArray:tempArray];
        [self addParsha:@[@"Rosh Hashana 1", @"א' ראש השנה"] toMutableArray:tempArray];
    }
    
    return tempArray;
}

#pragma mark - Ranges

- (NSArray *)createArrayWithNumbersInRange:(NSRange)aRange
{
	NSMutableArray *tempArray = [[NSMutableArray alloc] init];
	
	for (NSInteger i=aRange.location; i<aRange.length + aRange.location; i++)
    {
		[tempArray addObject:@(i)];
	}
	
	return [tempArray copy];
}

//
//  Counts the months in between Rosh Hashana to Rosh Hashana
//

- (BOOL)_isHebrewLeapYear:(NSInteger)year
{
    NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSHebrewCalendar];
    
    NSDate *previousRoshHashana = [NSDate dateWithDay:1 Month:1 Year:year andCalendar:hebrewCalendar];
    NSDate *nextRoshHashana = [NSDate dateWithDay:1 Month:1 Year:year+1 andCalendar:hebrewCalendar];
    
    return [hebrewCalendar monthsFromDate:previousRoshHashana toDate:nextRoshHashana] == 13;
}

#pragma mark - Parasha Arrangements

- (NSArray *)parshiotForYearType:(kHebrewYearType)type inDiaspora:(BOOL)diaspora
{
    return  diaspora ? [self _parshiotForDiasporaDuringYearType:type] : [self _parshiotForIsraelDuringYearType:type];
}

#pragma mark - Parasha For Given Date

- (NSString *)parashaForDate:(NSDate *)date inDiaspora:(BOOL)isInDiaspora
{
    
    //  Get this shabbat
    NSDate *shabbat = [[self gregorianCalendar] lastDayOfTheWeekUsingReferenceDate:date];
    
    NSUInteger weekNumber = [[self hebrewCalendar] weekOfYearInDate:shabbat];
    
    kHebrewYearType type = [NSCalendar typeOfHebrewYearContainingDate:shabbat];
    
	//
	//	Rearrange the parshios
	//
	
	NSMutableArray *temp;
	
	if(isInDiaspora == YES)
    {
		temp = [self _parshiotForDiasporaDuringYearType:type];
	}
    else
    {
		temp = [self _parshiotForIsraelDuringYearType:type];
	}
    
    //
    //	Then look up this weeks parsha
    //
    
    NSString *parsha;
    
    if(weekNumber < [temp count])
    {
        parsha = temp[weekNumber][self.useHebrewNames];
    }
    else
    {
        return kOutOfRangeString;
    }
    
    return parsha;
	
}

@end