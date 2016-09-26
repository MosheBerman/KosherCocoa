/**
 *  KCSefiraFormatter.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 10/23/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "KCSefiraFormatter.h"
#import <Foundation/Foundation.h>

#pragma mark - This class isn't finished yet.

@interface KCSefiraFormatter ()

// English and Hebrew Omer Strings
@property (nonatomic, strong) NSArray <NSString *> *englishStrings;
@property (nonatomic, strong) NSArray <NSString *> *ashkenazHebrewStrings;
@property (nonatomic, strong) NSArray <NSString *> *sefardHebrewStrings;
@property (nonatomic, strong) NSArray <NSString *> *sephardicHebrewStrings;

// Transliterated Omer Strings
@property (nonatomic, strong) NSArray <NSString *> *ashkenazTransliteratedStrings;
@property (nonatomic, strong) NSArray <NSString *> *sefardTransliteratedStrings;
@property (nonatomic, strong) NSArray <NSString *> *sephardicTransliteratedStrings;

// Kabbalistic Trait Strings
@property (nonatomic, strong) NSArray <NSString *> *englishKabbalisticStrings;
@property (nonatomic, strong) NSArray <NSString *> *hebrewKabbalisticStrings;
@property (nonatomic, strong) NSArray <NSString *> *transliteratedHebrewKabbalisticStrings;

@end

@implementation KCSefiraFormatter

/**
 *  The designated initializer.
 */

- (nonnull id)init
{
    self = [super init];
    if (self)
    {
        _language = KCSefiraLanguageHebrew; //  Default language is Hebrew
        _custom = KCSefiraCustomSefard;     //  Default custom is Sefard
        
        _englishStrings = @[
                            @"Today is the first day in the counting of the omer.",
                            @"Today is the second day in the counting of the omer.",
                            @"Today is the third day in the counting of the omer.",
                            @"Today is the fourth day in the counting of the omer.",
                            @"Today is the fifth day in the counting of the omer.",
                            @"Today is the sixth day in the counting of the omer.",
                            @"Today is the seventh day in the counting of the omer, which is one week.",
                            @"Today is the eighth day in the counting of the omer, which is one week and one day.",
                            @"Today is the ninth day in the counting of the omer, which is one week and two days.",
                            @"Today is the tenth day in the counting of the omer, which is one week and three days.",
                            @"Today is the eleventh day in the counting of the omer, which is one week and four days.",
                            @"Today is the twelfth day in the counting of the omer, which is one week and five days.",
                            @"Today is the thirteenth day in the counting of the omer, which is one week and six days.",
                            @"Today is the fourteenth day in the counting of the omer, which is two weeks.",
                            @"Today is the fifteenth day in the counting of the omer, which is two weeks and one day.",
                            @"Today is the sixteenth day in the counting of the omer, which is two weeks and two days.",
                            @"Today is the seventeenth day in the counting of the omer, which is two weeks and three days.",
                            @"Today is the eighteenth day in the counting of the omer, which is two weeks and four days.",
                            @"Today is the nineteenth day in the counting of the omer, which is two weeks and five days.",
                            @"Today is the twentieth day in the counting of the omer, which is two weeks and six days.",
                            @"Today is the twenty first day in the counting of the omer, which is three weeks.",
                            @"Today is the twenty second day in the counting of the omer, which is three weeks and one day.",
                            @"Today is the twenty third day in the counting of the omer, which is three weeks and two days.",
                            @"Today is the twenty fourth day in the counting of the omer, which is three weeks and three days.",
                            @"Today is the twenty fifth day in the counting of the omer, which is three weeks and four days.",
                            @"Today is the twenty sixth day in the counting of the omer, which is three weeks and five days.",
                            @"Today is the twenty seventh day in the counting of the omer, which is three weeks and six days.",
                            @"Today is the twenty eighth day in the counting of the omer, which is four weeks.",
                            @"Today is the twenty ninth day in the counting of the omer, which is four weeks and one day.",
                            @"Today is the thirtieth day in the counting of the omer, which is four weeks and two days.",
                            @"Today is the thirtieth first day in the counting of the omer, which is four weeks and three days.",
                            @"Today is the thirtieth second day in the counting of the omer, which is four weeks and four days.",
                            @"Today is the thirtieth third day in the counting of the omer, which is four weeks and five days.",
                            @"Today is the thirtieth fourth day in the counting of the omer, which is four weeks and six days.",
                            @"Today is the thirtieth fifth day in the counting of the omer, which is five weeks.",
                            @"Today is the thirtieth sixth day in the counting of the omer, which is five weeks and one day.",
                            @"Today is the thirtieth seventh day in the counting of the omer, which is five weeks and two days.",
                            @"Today is the thirtieth eighth day in the counting of the omer, which is five weeks and three days.",
                            @"Today is the thirtieth ninth day in the counting of the omer, which is five weeks and four days.",
                            @"Today is the fourtieth day in the counting of the omer, which is five weeks and five days.",
                            @"Today is the forty first day in the counting of the omer, which is five weeks and six days.",
                            @"Today is the forty second day in the counting of the omer, which is six weeks.",
                            @"Today is the forty third day in the counting of the omer, which is six weeks and one day.",
                            @"Today is the forty fourth day in the counting of the omer, which is six weeks and two days.",
                            @"Today is the forty fifth day in the counting of the omer, which is six weeks and three days.",
                            @"Today is the forty sixth day in the counting of the omer, which is six weeks and four days.",
                            @"Today is the forty seventh day in the counting of the omer, which is six weeks and five days.",
                            @"Today is the forty eighth day in the counting of the omer, which is six weeks and six days.",
                            @"Today is the forty ninth day in the counting of the omer, which is seven weeks.",
                            ];
        
        _ashkenazHebrewStrings = @[
                                   @"הַיוֹם יוֹם אֶחָד בָּעוֹמֶר",
                                   @"הַיוֹם שְׁנֵי יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם שְׁלֹשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם אַרְבָּעָה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם חֲמִשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם שִׁשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם שִׁבְעָה יָמִים שֶׁהֵם שָׁבוּעַ אֶחָד בָּעוֹמֶר",
                                   @"הַיוֹם שְׁמוֹנָה יָמִים שֶׁהֵם שָׁבוּעַ אֶחָד וְיוֹם אֶחָד בָּעוֹמֶר",
                                   @"הַיוֹם תִּשְׁעָה יָמִים שֶׁהֵם שָׁבוּעַ אֶחָד וּשְׁנֵי יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם עֲשָׂרָה יָמִים שֶׁהֵם שָׁבוּעַ אֶחָד וּשְׁלֹשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם אֲחַד עָשָׂר יוֹם שֶׁהֵם שָׁבוּעַ אֶחָד וְאַרְבָּעָה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם שְׁנֵים עָשָׂר יוֹם שֶׁהֵם שָׁבוּעַ אֶחָד וַחֲמִשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם שְׁלֹשָׁה עָשָׂר יוֹם שֶׁהֵם שָׁבוּעַ אֶחָד ושִׁשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם אַרְבָּעָה עָשָׂר יוֹם שֶׁהֵם שְׁנֵי שָׁבוּעוֹת בָּעוֹמֶר",
                                   @"הַיוֹם חֲמִשָׁה עָשָׂר יוֹם שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וְיוֹם אֶחָד בָּעוֹמֶר",
                                   @"הַיוֹם שִׁשָׁה עָשָׂר יוֹם שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וּשְׁנֵי יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם שִׁבְעָה עָשָׂר יוֹם שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם שְׁמוֹנָה עָשָׂר יוֹם שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וְאַרְבָּעָה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם תִּשְׁעָה עָשָׂר יוֹם שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וַחֲמִשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם עֶשְׂרִים יוֹם שֶׁהֵם שְׁנֵי שָׁבוּעוֹת ושִׁשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם אֶחָד וְעֶשְׂרים יוֹם שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת בָּעוֹמֶר",
                                   @"הַיוֹם שְׁנַיִם וְעֶשְׂרים יוֹם שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וְיוֹם אֶחָד בָּעוֹמֶר",
                                   @"הַיוֹם שְׁלֹשָׁה וְעֶשְׂרים יוֹם שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וּשְׁנֵי יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם אַרְבָּעָה וְעֶשְׂרים יוֹם שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם חֲמִשָׁה וְעֶשְׂרים יוֹם שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וְאַרְבָּעָה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם שִׁשָׁה וְעֶשְׂרים יוֹם שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וַחֲמִשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם שִׁבְעָה וְעֶשְׂרים יוֹם שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת ושִׁשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם שְׁמוֹנָה וְעֶשְׂרים יוֹם שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת בָּעוֹמֶר",
                                   @"הַיוֹם תִּשְׁעָה וְעֶשְׂרים יוֹם שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וְיוֹם אֶחָד בָּעוֹמֶר",
                                   @"הַיוֹם שְׁלֹשִׁים יוֹם שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וּשְׁנֵי יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם אֶחָד וּשְׁלֹשִׁים יוֹם שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם שְׁנַיִם וּשְׁלֹשִׁים יוֹם שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וְאַרְבָּעָה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם שְׁלֹשָׁה וּשְׁלֹשִׁים יוֹם שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וַחֲמִשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם אַרְבָּעָה וּשְׁלֹשִׁים יוֹם שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת ושִׁשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם חֲמִשָׁה וּשְׁלֹשִׁים יוֹם שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת בָּעוֹמֶר",
                                   @"הַיוֹם שִׁשָׁה וּשְׁלֹשִׁים יוֹם שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת וְיוֹם אֶחָד בָּעוֹמֶר",
                                   @"הַיוֹם שִׁבְעָה וּשְׁלֹשִׁים יוֹם שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת וּשְׁנֵי יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם שְׁמוֹנָה וּשְׁלֹשִׁים יוֹם שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם תִּשְׁעָה וּשְׁלֹשִׁים יוֹם שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת וְאַרְבָּעָה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם אַרְבָּעִים יוֹם שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת וַחֲמִשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם אֶחָד וְאַרְבָּעִים יוֹם שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת ושִׁשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם שְׁנַיִם וְאַרְבָּעִים יוֹם שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת בָּעוֹמֶר",
                                   @"הַיוֹם שְׁלֹשָׁה וְאַרְבָּעִים יוֹם שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת וְיוֹם אֶחָד בָּעוֹמֶר",
                                   @"הַיוֹם אַרְבָּעָה וְאַרְבָּעִים יוֹם שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת וּשְׁנֵי יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם חֲמִשָׁה וְאַרְבָּעִים יוֹם שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם שִׁשָׁה וְאַרְבָּעִים יוֹם שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת וְאַרְבָּעָה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם שִׁבְעָה וְאַרְבָּעִים יוֹם שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת וַחֲמִשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם שְׁמוֹנָה וְאַרְבָּעִים יוֹם שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת ושִׁשָׁה יָמִים בָּעוֹמֶר",
                                   @"הַיוֹם תִּשְׁעָה וְאַרְבָּעִים יוֹם שֶׁהֵם שִׁבְעָה שָׁבוּעוֹת בָּעוֹמֶר"
                                   ];
        
        _sefardHebrewStrings = @[
                                 @"הַיוֹם יוֹם אֶחָד לָעוֹמֶר",
                                 @"הַיוֹם שְׁנֵי יָמִים לָעוֹמֶר",
                                 @"הַיוֹם שְׁלֹשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם אַרְבָּעָה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם חֲמִשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם שִׁשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם שִׁבְעָה יָמִים שֶׁהֵם שָׁבוּעַ אֶחָד לָעוֹמֶר",
                                 @"הַיוֹם שְׁמוֹנָה יָמִים שֶׁהֵם שָׁבוּעַ אֶחָד וְיוֹם אֶחָד לָעוֹמֶר",
                                 @"הַיוֹם תִּשְׁעָה יָמִים שֶׁהֵם שָׁבוּעַ אֶחָד וּשְׁנֵי יָמִים לָעוֹמֶר",
                                 @"הַיוֹם עֲשָׂרָה יָמִים שֶׁהֵם שָׁבוּעַ אֶחָד וּשְׁלֹשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם אֲחַד עָשָׂר יוֹם שֶׁהֵם שָׁבוּעַ אֶחָד וְאַרְבָּעָה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם שְׁנֵים עָשָׂר יוֹם שֶׁהֵם שָׁבוּעַ אֶחָד וַחֲמִשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם שְׁלֹשָׁה עָשָׂר יוֹם שֶׁהֵם שָׁבוּעַ אֶחָד ושִׁשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם אַרְבָּעָה עָשָׂר יוֹם שֶׁהֵם שְׁנֵי שָׁבוּעוֹת לָעוֹמֶר",
                                 @"הַיוֹם חֲמִשָׁה עָשָׂר יוֹם שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וְיוֹם אֶחָד לָעוֹמֶר",
                                 @"הַיוֹם שִׁשָׁה עָשָׂר יוֹם שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וּשְׁנֵי יָמִים לָעוֹמֶר",
                                 @"הַיוֹם שִׁבְעָה עָשָׂר יוֹם שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם שְׁמוֹנָה עָשָׂר יוֹם שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וְאַרְבָּעָה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם תִּשְׁעָה עָשָׂר יוֹם שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וַחֲמִשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם עֶשְׂרִים יוֹם שֶׁהֵם שְׁנֵי שָׁבוּעוֹת ושִׁשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם אֶחָד וְעֶשְׂרים יוֹם שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת לָעוֹמֶר",
                                 @"הַיוֹם שְׁנַיִם וְעֶשְׂרים יוֹם שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וְיוֹם אֶחָד לָעוֹמֶר",
                                 @"הַיוֹם שְׁלֹשָׁה וְעֶשְׂרים יוֹם שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וּשְׁנֵי יָמִים לָעוֹמֶר",
                                 @"הַיוֹם אַרְבָּעָה וְעֶשְׂרים יוֹם שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם חֲמִשָׁה וְעֶשְׂרים יוֹם שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וְאַרְבָּעָה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם שִׁשָׁה וְעֶשְׂרים יוֹם שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וַחֲמִשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם שִׁבְעָה וְעֶשְׂרים יוֹם שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת ושִׁשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם שְׁמוֹנָה וְעֶשְׂרים יוֹם שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת לָעוֹמֶר",
                                 @"הַיוֹם תִּשְׁעָה וְעֶשְׂרים יוֹם שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וְיוֹם אֶחָד לָעוֹמֶר",
                                 @"הַיוֹם שְׁלֹשִׁים יוֹם שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וּשְׁנֵי יָמִים לָעוֹמֶר",
                                 @"הַיוֹם אֶחָד וּשְׁלֹשִׁים יוֹם שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם שְׁנַיִם וּשְׁלֹשִׁים יוֹם שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וְאַרְבָּעָה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם שְׁלֹשָׁה וּשְׁלֹשִׁים יוֹם שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וַחֲמִשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם אַרְבָּעָה וּשְׁלֹשִׁים יוֹם שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת ושִׁשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם חֲמִשָׁה וּשְׁלֹשִׁים יוֹם שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת לָעוֹמֶר",
                                 @"הַיוֹם שִׁשָׁה וּשְׁלֹשִׁים יוֹם שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת וְיוֹם אֶחָד לָעוֹמֶר",
                                 @"הַיוֹם שִׁבְעָה וּשְׁלֹשִׁים יוֹם שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת וּשְׁנֵי יָמִים לָעוֹמֶר",
                                 @"הַיוֹם שְׁמוֹנָה וּשְׁלֹשִׁים יוֹם שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם תִּשְׁעָה וּשְׁלֹשִׁים יוֹם שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת וְאַרְבָּעָה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם אַרְבָּעִים יוֹם שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת וַחֲמִשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם אֶחָד וְאַרְבָּעִים יוֹם שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת ושִׁשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם שְׁנַיִם וְאַרְבָּעִים יוֹם שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת לָעוֹמֶר",
                                 @"הַיוֹם שְׁלֹשָׁה וְאַרְבָּעִים יוֹם שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת וְיוֹם אֶחָד לָעוֹמֶר",
                                 @"הַיוֹם אַרְבָּעָה וְאַרְבָּעִים יוֹם שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת וּשְׁנֵי יָמִים לָעוֹמֶר",
                                 @"הַיוֹם חֲמִשָׁה וְאַרְבָּעִים יוֹם שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם שִׁשָׁה וְאַרְבָּעִים יוֹם שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת וְאַרְבָּעָה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם שִׁבְעָה וְאַרְבָּעִים יוֹם שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת וַחֲמִשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם שְׁמוֹנָה וְאַרְבָּעִים יוֹם שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת ושִׁשָׁה יָמִים לָעוֹמֶר",
                                 @"הַיוֹם תִּשְׁעָה וְאַרְבָּעִים יוֹם שֶׁהֵם שִׁבְעָה שָׁבוּעוֹת לָעוֹמֶר"
                                 ];
        
        _sephardicHebrewStrings = @[
                                    @"הַיוֹם יוֹם אֶחָד לָעוֹמֶר",
                                    @"הַיוֹם שְׁנֵי יָמִים לָעוֹמֶר",
                                    @"הַיוֹם שְׁלֹשָׁה יָמִים לָעוֹמֶר",
                                    @"הַיוֹם אַרְבָּעָה יָמִים לָעוֹמֶר",
                                    @"הַיוֹם חֲמִשָׁה יָמִים לָעוֹמֶר",
                                    @"הַיוֹם שִׁשָׁה יָמִים לָעוֹמֶר",
                                    @"הַיוֹם שִׁבְעָה יָמִים לָעוֹמֶר שֶׁהֵם שָׁבוּעַ אֶחָד",
                                    @"הַיוֹם שְׁמוֹנָה יָמִים לָעוֹמֶר שֶׁהֵם שָׁבוּעַ אֶחָד וְיוֹם אֶחָד",
                                    @"הַיוֹם תִּשְׁעָה יָמִים לָעוֹמֶר שֶׁהֵם שָׁבוּעַ אֶחָד וּשְׁנֵי",
                                    @"הַיוֹם עֲשָׂרָה יָמִים לָעוֹמֶר שֶׁהֵם שָׁבוּעַ אֶחָד וּשְׁלֹשָׁה יָמִים",
                                    @"הַיוֹם אֲחַד עָשָׂר יוֹם לָעוֹמֶר שֶׁהֵם שָׁבוּעַ אֶחָד וְאַרְבָּעָה יָמִים",
                                    @"הַיוֹם שְׁנֵים עָשָׂר יוֹם לָעוֹמֶר שֶׁהֵם שָׁבוּעַ אֶחָד וַחֲמִשָׁה יָמִים",
                                    @"הַיוֹם שְׁלֹשָׁה עָשָׂר יוֹם לָעוֹמֶר שֶׁהֵם שָׁבוּעַ אֶחָד ושִׁשָׁה יָמִים",
                                    @"הַיוֹם אַרְבָּעָה עָשָׂר יוֹם לָעוֹמֶר שֶׁהֵם שְׁנֵי שָׁבוּעוֹת",
                                    @"הַיוֹם חֲמִשָׁה עָשָׂר יוֹם לָעוֹמֶר שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וְיוֹם אֶחָד",
                                    @"הַיוֹם שִׁשָׁה עָשָׂר יוֹם לָעוֹמֶר שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וּשְׁנֵי יָמִים",
                                    @"הַיוֹם שִׁבְעָה עָשָׂר יוֹם לָעוֹמֶר שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים",
                                    @"הַיוֹם שְׁמוֹנָה עָשָׂר יוֹם לָעוֹמֶר שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וְאַרְבָּעָה יָמִים",
                                    @"הַיוֹם תִּשְׁעָה עָשָׂר יוֹם לָעוֹמֶר שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וַחֲמִשָׁה יָמִים",
                                    @"הַיוֹם עֶשְׂרִים יוֹם לָעוֹמֶר שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וְשִׁשָׁה יָמִים",
                                    @"הַיוֹם אֶחָד וְעֶשְׂרִים יוֹם לָעוֹמֶר שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת",
                                    @"הַיוֹם שְׁנַיִם וְעֶשְׂרים יוֹם לָעוֹמֶר שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וְיוֹם אֶחָד",
                                    @"הַיוֹם שְׁלֹשָׁה וְעֶשְׂרים יוֹם לָעוֹמֶר שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וּשְׁנֵי יָמִים",
                                    @"הַיוֹם אַרְבָּעָה וְעֶשְׂרִים יוֹם לָעוֹמֶר שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים",
                                    @"הַיוֹם חֲמִשָׁה וְעֶשְׂרים יוֹם לָעוֹמֶר שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וְאַרְבָּעָה יָמִים",
                                    @"הַיוֹם שִׁשָׁה וְעֶשְׂרים יוֹם לָעוֹמֶר שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וַחֲמִשָׁה יָמִים",
                                    @"הַיוֹם שִׁבְעָה וְעֶשְׂרים יוֹם לָעוֹמֶר שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וְשִׁשָׁה יָמִים",
                                    @"הַיוֹם שְׁמוֹנָה וְעֶשְׂרים יוֹם לָעוֹמֶר שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת",
                                    @"הַיוֹם תִּשְׁעָה וְעֶשְׂרים יוֹם לָעוֹמֶר שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וְיוֹם אֶחָד",
                                    @"הַיוֹם שְׁלֹשִׁים יוֹם לָעוֹמֶר שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וּשְׁנֵי יָמִים",
                                    @"הַיוֹם אֶחָד וּשְׁלֹשִׁים יוֹם לָעוֹמֶר שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים",
                                    @"הַיוֹם שְׁנַיִם וּשְׁלֹשִׁים יוֹם לָעוֹמֶר שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וְאַרְבָּעָה יָמִים",
                                    @"הַיוֹם שְׁלֹשָׁה וּשְׁלֹשִׁים יוֹם לָעוֹמֶר שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וַחֲמִשָׁה יָמִים",
                                    @"הַיוֹם אַרְבָּעָה וּשְׁלֹשִׁים יוֹם לָעוֹמֶר שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת ושִׁשָׁה יָמִים",
                                    @"הַיוֹם חֲמִשָׁה וּשְׁלֹשִׁים יוֹם לָעוֹמֶר שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת",
                                    @"הַיוֹם שִׁשָׁה וּשְׁלֹשִׁים יוֹם לָעוֹמֶר שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת וְיוֹם אֶחָד",
                                    @"הַיוֹם שִׁבְעָה וּשְׁלֹשִׁים יוֹם לָעוֹמֶר שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת וּשְׁנֵי יָמִים",
                                    @"הַיוֹם שְׁמוֹנָה וּשְׁלֹשִׁים יוֹם לָעוֹמֶר שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים",
                                    @"הַיוֹם תִּשְׁעָה וּשְׁלֹשִׁים יוֹם לָעוֹמֶר שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת וְאַרְבָּעָה יָמִים",
                                    @"הַיוֹם אַרְבָּעִים יוֹם לָעוֹמֶר שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת וַחֲמִשָׁה יָמִים",
                                    @"הַיוֹם אֶחָד וְאַרְבָּעִים יוֹם לָעוֹמֶר שֶׁהֵם חֲמִשָׁה שָׁבוּעוֹת וְשִׁשָׁה יָמִים",
                                    @"הַיוֹם שְׁנַיִם וְאַרְבָּעִים יוֹם לָעוֹמֶר שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת",
                                    @"הַיוֹם שְׁלֹשָׁה וְאַרְבָּעִים יוֹם לָעוֹמֶר שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת וְיוֹם אֶחָד",
                                    @"הַיוֹם אַרְבָּעָה וְאַרְבָּעִים יוֹם לָעוֹמֶר שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת וּשְׁנֵי יָמִים",
                                    @"הַיוֹם חֲמִשָׁה וְאַרְבָּעִים יוֹם לָעוֹמֶר שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים",
                                    @"הַיוֹם שִׁשָׁה וְאַרְבָּעִים יוֹם לָעוֹמֶר שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת וְאַרְבָּעָה יָמִים",
                                    @"הַיוֹם שִׁבְעָה וְאַרְבָּעִים יוֹם לָעוֹמֶר שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת וַחֲמִשָׁה יָמִים",
                                    @"הַיוֹם שְׁמוֹנָה וְאַרְבָּעִים יוֹם לָעוֹמֶר שֶׁהֵם שִׁשָׁה שָׁבוּעוֹת וְשִׁשָׁה יָמִים",
                                    @"הַיוֹם תִּשְׁעָה וְאַרְבָּעִים יוֹם לָעוֹמֶר שֶׁהֵם שִׁבְעָה שָׁבוּעוֹת",
                                    ];
        
        _ashkenazTransliteratedStrings = @[];
        _sefardTransliteratedStrings = @[];
        _sephardicTransliteratedStrings = @[];
        
        _hebrewKabbalisticStrings = @[
                                      @"חֶסֶד שֶבְּחֶסֶד",
                                      @"גְבוּרָה שֶבְּחֶסֶד",
                                      @"תִּפֶארֶת שֶבְּחֶסֶד",
                                      @"נֶצַח שֶבְּחֶסֶד",
                                      @"הוֹד שֶבְּחֶסֶד",
                                      @"יְסֹוד שֶבְּחֶסֶד",
                                      @"מַלְכוּת שֶבְּחֶסֶד",
                                      @"חֶסֶד שֶבְּגְבוּרָה",
                                      @"גְבוּרָה שֶבְּגְבוּרָה",
                                      @"תִּפֶארֶת שֶבְּגְבוּרָה",
                                      @"נֶצַח שֶבְּגְבוּרָה",
                                      @"הוֹד שֶבְּגְבוּרָה",
                                      @"יְסֹוד שֶבְּגְבוּרָה",
                                      @"מַלְכוּת שֶבְּגְבוּרָה",
                                      @"חֶסֶד שֶבְּתִּפֶארֶת",
                                      @"גְבוּרָה שֶבְּתִּפֶארֶת",
                                      @"תִּפֶארֶת שֶבְּתִּפֶארֶת",
                                      @"נֶצַח שֶבְּתִּפֶארֶת",
                                      @"הוֹד שֶבְּתִּפֶארֶת",
                                      @"יְסֹוד שֶבְּתִּפֶארֶת",
                                      @"מַלְכוּת שֶבְּתִּפֶארֶת",
                                      @"חֶסֶד שֶבְּנֶצַח",
                                      @"גְבוּרָה שֶבְּנֶצַח",
                                      @"תִּפֶארֶת שֶבְּנֶצַח",
                                      @"נֶצַח שֶבְּנֶצַח",
                                      @"הוֹד שֶבְּנֶצַח",
                                      @"יְסֹוד שֶבְּנֶצַח",
                                      @"מַלְכוּת שֶבְּנֶצַח"
                                      , @"חֶסֶד שֶבְּהוֹד",
                                      @"גְבוּרָה שֶבְּהוֹד",
                                      @"תִּפֶארֶת שֶבְּהוֹד",
                                      @"נֶצַח שֶבְּהוֹד",
                                      @"הוֹד שֶבְּהוֹד",
                                      @"יְסֹוד שֶבְּהוֹד",
                                      @"מַלְכוּת שֶבְּהוֹד",
                                      @"חֶסֶד שֶבְּיְסֹוד",
                                      @"גְבוּרָה שֶבְּיְסֹוד",
                                      @"תִּפֶארֶת שֶבְּיְסֹוד",
                                      @"נֶצַח שֶבְּיְסֹוד",
                                      @"הוֹד שֶבְּיְסֹוד",
                                      @"יְסֹוד שֶבְּיְסֹוד",
                                      @"מַלְכוּת שֶבְּיְסֹוד",
                                      @"חֶסֶד שֶבְּמַלְכוּת",
                                      @"גְבוּרָה שֶבְּמַלְכוּת",
                                      @"תִּפֶארֶת שֶבְּמַלְכוּת",
                                      @"נֶצַח שֶבְּמַלְכוּת",
                                      @"הוֹד שֶבְּמַלְכוּת",
                                      @"יְסֹוד שֶבְּמַלְכוּת",
                                      @"מַלְכוּת שֶבְּמַלְכוּת"
                                      ];
        _englishKabbalisticStrings = @[];
        _transliteratedHebrewKabbalisticStrings = @[];
    }
    return self;
}

#pragma mark - Getting the Count

- (NSString *)countStringFromInteger:(NSInteger)integer
{
    
    if (integer < 1 || integer > 49) {
        return nil;
    }
    
    integer = integer - 1;
    
    NSString *countText = nil;
    
    NSArray *composite = [self _omerCountStringMap];
    
    NSInteger language = self.language;
    NSInteger custom = self.custom;
    
    if (language == KCSefiraLanguageEnglish) //  There's only one version of English.
    {
        custom = 0;
    }
    
    if (language < composite.count)
    {
        NSArray <NSArray <NSString *> *> *customs = composite[language];
        
        if (custom < customs.count)
        {
            NSArray <NSString *> *strings = customs[custom];
            
            if (integer < strings.count)
            {
                countText = strings[integer];
            }
            else
            {
                NSLog(@"Integer for day is out of range. (Value: %li)", (long)integer);
            }
        }
        else
        {
            NSLog(@"Custom is out of range. (Value: %li", (long)custom);
        }
    }
    else
    {
        NSLog(@"Language is out of range. (Value: %li)", (long)language);
    }
    
    return countText;
}

- (nullable NSString *)countStringFromInteger:(NSInteger)integer withPrayers:(enum KCSefiraPrayerAddition)prayers
{
    if (integer < 1 || integer > 49) {
        return nil;
    }
    
    NSMutableString *output = [[NSMutableString alloc] initWithString:@""];
    
    BOOL showLeshaim = [self _isFlagEnabled: KCSefiraPrayerAdditionLeshaimYichud inFlags:prayers];
    BOOL showBeracha = [self _isFlagEnabled: KCSefiraPrayerAdditionBeracha inFlags:prayers];
    BOOL showHarachaman = [self _isFlagEnabled: KCSefiraPrayerAdditionHarachaman inFlags:prayers];
    BOOL showLamenatzaiach = [self _isFlagEnabled: KCSefiraPrayerAdditionLamenatzaiach inFlags:prayers];
    BOOL showAna = [self _isFlagEnabled: KCSefiraPrayerAdditionAna inFlags:prayers];
    BOOL showRibono = [self _isFlagEnabled: KCSefiraPrayerAdditionRibono inFlags:prayers];
    BOOL showAleinu = [self _isFlagEnabled: KCSefiraPrayerAdditionAleinu inFlags:prayers];
    
    NSString *leshaim = nil;
    NSString *beracha = nil;
    NSString *harachaman = nil;
    NSString *lamenatzaiach = nil;
    NSString *ana = nil;
    NSString *ribono = nil;
    NSString *aleinu = nil;
    
    if (showLeshaim)
    {
        if (self.custom == KCSefiraCustomSephardic)
        {
            leshaim = @"לְשֵׁם יִחוּד קוּדְשָׁא בְּרִיךְ הוּא וּשְׁכִינְתֵּיהּ בִּדְחִילוּ וּרְחִימוּ. לְיַחֵדָא שֵׁם יוֹד קֵי בְּוָאו קֵי בְּיִחוּדָא שְׁלִים בְּשֵׁם כָּל יִשְׂרָאֵל הִנֵּה אֲנַחְנוּ בָּאִים לְקַיֵּם מִצְוַת עֲשֵׂה שֶׁל סְפִירַת הָעֹמֶר. כְּדִכְתִיב: וּסְפַרְתֶּם לָכֶם מִמָּחֳרַת הַשַּׁבָּת מִיוֹם הֲבִיאֲכֶם אֶת עֹמֶר הַתְּנוּפָה. שֶׁבַע שַׁבָּתוֹת תְּמִימוֹת תִּהְיֶינָה. עַד מִמָּחֳרַת הַשַּׁבָּת הַשְּׁבִיעִית תִּסְפְּרוּ חֲמִשִּׁים יוֹם. וְהִקְרַבְתֶּם מִנְחָה חֲדָשָׁה לַיהוָה: לְתַקֵּן אֶת שָׁרְשָׁה בְּמָקוֹם עֶלְיוֹן. לַעֲשֹוֹת נַחַת רוּח לְיוֹצְרֵנוּ וְלַעֲשֹוֹת רְצוֹן בּוֹרְאֵנוּ. וִיהִי נוֹעַם אֲדנָי אֱלהֵינוּ עָלֵינוּ. וּמַעֲשֵׂה יָדֵינוּ כּוֹנְנָה עָלֵינוּ. וּמַעֲשֵׂה יָדֵינוּ כּוֹנְנֵהוּ: יְהוָה, יִגְמֹר בַּעֲדִי. יְהוָה, חַסְדְּךָ לְעוֹלָם; מַעֲשֵׂי יָדֶיךָ אַל-תֶּרֶף: אֶקְרָא, לֵאלֹהִים עֶלְיוֹן; לָאֵל, גֹּמֵר עָלָי: וָאֶעֱבֹר עָלַיִךְ וָאֶרְאֵךְ, מִתְבּוֹסֶסֶת בְּדָמָיִךְ, וָאֹמַר לָךְ בְּדָמַיִךְ חֲיִי, וָאֹמַר לָךְ בְּדָמַיִךְ חֲיִי: בָּרְכִי נַפְשִׁי, אֶת-יְהוָה: יְהוָה אֱלֹהַי, גָּדַלְתָּ מְּאֹד; הוֹד .וְהָדָר לָבָשְׁתָּ. עֹטֶה-אוֹר, כַּשַּׂלְמָה, נוֹטֶה שָׁמַיִם, כַּיְרִיעָה";
        }
        else
        {
            leshaim = @"לְשֵׁם יִחוּד קֻדְשָׁא בְּרִיךְ הוּא וּשְׁכִינְתֵּהּ, בִּדְחִילוּ וּרְחִימוּ, לְיַחֵד שֵׁם י\"ה בְּו\"ה בְּיִחוּדָא שְׁלִים, בְֹּשֵם כָּל יִשְׂרָאֵל. הִנְנִי מוּכָן וּמְזֻמָּן לְקַיֵּם מִצְוַת עֲשֵׂה שֶׁל סְפִירַת הָעֹֽמֶר, כְּמוֹ שֶׁכָּתוּב בַּתּוֹרָה: וּסְפַרְתֶּם לָכֶם מִמָּחֳרַת הַשַּׁבָּת מִיּוֹם הֲבִיאֲכֶם אֶת עֹֽמֶר הַתְּנוּפָה, שֶֽׁבַע שַׁבָּתוֹת תְּמִימֹת תִּהְיֶֽינָה. עַד מִמָּחֳרַת הַשַּׁבָּת הַשְּׁבִיעִת תִּסְפְּרוּ חֲמִשִּׁים יוֹם, וְהִקְרַבְתֶּם מִנְחָה חֲדָשָׁה לַייָ. וִיהִי נֹֽעַם אֲדֹנָי אֱלֹהֵֽינוּ עָלֵֽינוּ, וּמַעֲשֵׂה יָדֵֽינוּ כּוֹנְנָה עָלֵֽינוּ, וּמַעֲשֵׂה יָדֵֽינוּ כּוֹנְנֵֽהוּ.";
        }
        
        [output appendString:leshaim];
    }
    
    if (showBeracha)
    {
        beracha = [self blessing];
        
        [output appendString:@"\n\n"];
        [output appendString:beracha];
    }
    
    NSString *countString = [self countStringFromInteger:integer];
    
    if(output.length > 0)
    {
        [output appendString:@"\n\n"];
    }
    
    [output appendString:countString];
    
    
    if (showHarachaman)
    {
        
        if (self.custom == KCSefiraCustomSephardic)
        {
            harachaman = @"הָרַחֲמָן הוּא יִבְנֶה בֵּית הַמִקְדָשׁ, ְויַחֲזֵיר הָעֲבוֹדָה לִמְקוֹמָה בִּמְהֵרָה בְיָמֵינוּ. אָמֵן";
        }
        else
        {
            harachaman = @"הָרַחֲמָן הוּא יַחֲזִיר לָֽנוּ עֲבוֹדַת בֵּית הַמִּקְדָּשׁ לִמְקוֹמָהּ, בִּמְהֵרָה בְיָמֵֽינוּ אָמֵן סֶֽלָה.";
        }
        
        [output appendString:@"\n\n"];
        [output appendString:harachaman];
    }
    
    if (showLamenatzaiach)
    {
        lamenatzaiach = @"לַמְנַצֵּֽחַ בִּנְגִינוֹת מִזְמוֹר שִׁיר. אֱלֹהִים יְחָנֵּֽנוּ וִיבָרְכֵֽנוּ, יָאֵר פָּנָיו אִתָּֽנוּ סֶֽלָה. לָדַֽעַת בָּאָֽרֶץ דַּרְכֶּֽךָ, בְּכָל גּוֹיִם יְשׁוּעָתֶֽךָ. יוֹדֽוּךָ עַמִּים, אֱלֹהִים, יוֹדֽוּךָ עַמִּים כֻּלָּם. יִשְׂמְחוּ וִירַנְּנוּ לְאֻמִּים, כִּי תִשְׁפּוֹט עַמִּים מִישׁוֹר, וּלְאֻמִּים בָּאָֽרֶץ תַּנְחֵם סֶֽלָה. יוֹדֽוּךָ עַמִּים, אֱלֹהִים, יוֹדֽוּךָ עַמִּים כֻּלָּם. אֶֽרֶץ נָתְנָה יְבוּלָהּ, יְבָרְכֵֽנוּ אֱלֹהִים אֱלֹהֵֽינוּ. יְבָרְכֵֽנוּ אֱלֹהִים, וְיִירְאוּ אוֹתוֹ כָּל אַפְסֵי אָֽרֶץ.";
        
        [output appendString:@"\n\n"];
        [output appendString:lamenatzaiach];
    }
    
    if (showAna)
    {
        ana = @"אָנָּא בְּכֹֽחַ גְּדֻלַּת יְמִינְךָ, תַּתִּיר צְרוּרָה. \nאב\"ג ית\"ץ\nקַבֵּל רִנַּת עַמְּךָ, שַׂגְּבֵֽנוּ, טַהֲרֵֽנוּ, נוֹרָא.\nקר\"ע שט\"ן\nנָא גִבּוֹר, דּוֹרְשֵׁי יִחוּדְךָ, כְּבָבַת שָׁמְרֵם.\nנג\"ד יכ\"ש\nבָּרְכֵם, טַהֲרֵם, רַחֲמֵם, צִדְקָתְךָ תָּמִיד גָּמְלֵם. \nבט\"ר צת\"ג \nחֲסִין קָדוֹשׁ, בְּרוֹב טוּבְךָ, נַהֵל עֲדָתֶֽךָ. \nחק\"ב טנ\"ע \nיָחִיד גֵּאֶה, לְעַמְּךָ פְּנֵה, זוֹכְרֵי קְדֻשָּׁתֶֽךָ.\nיג\"ל פז\"ק \nשַׁוְעָתֵֽנוּ קַבֵּל, וּשְׁמַע צַעֲקָתֵֽנוּ, יוֹדֵֽעַ תַּעֲלֻמוֹת. \nשק\"ו צי\"ת\n\nבָּרוּךְ שֵׁם כְּבוֹד מַלְכוּתוֹ לְעוֹלָם וָעֶד.";
        
        [output appendString:@"\n\n" ];
        [output appendString:ana];
    }
    
    if (showRibono)
    {
        
        NSString *trait = [self kabbalisticTraitFromInteger:integer];
        
        ribono = [NSString stringWithFormat:@"רִבּוֹנוֹ שֶׁל עוֹלָם, אַתָּה צִוִּיתָֽנוּ עַל יְדֵי מֹשֶׁה עַבְדֶּֽךָ לִסְפּוֹר סְפִירַת הָעֹֽמֶר, כְּדֵי לְטַהֲרֵֽנוּ מִקְּלִפּוֹתֵֽינוּ וּמִטֻּמְאוֹתֵֽינוּ, כְּמוֹ שֶׁכָּתַֽבְתָּ בְּתוֹרָתֶֽךָ: וּסְפַרְתֶּם לָכֶם מִמָּחֳרַת הַשַּׁבָּת מִיּוֹם הֲבִיאֲכֶם אֶת עֹֽמֶר הַתְּנוּפָה, שֶֽׁבַע שַׁבָּתוֹת תְּמִימֹת תִּהְיֶֽינָה, עַד מִמָּחֳרַת הַשַּׁבָּת הַשְּׁבִיעִת תִּסְפְּרוּ חֲמִשִּׁים יוֹם, כְּדֵי שֶׁיִּטָּהֲרוּ נַפְשׁוֹת עַמְּךָ יִשְׂרָאֵל מִזֻּהֲמָתָם. וּבְכֵן יְהִי רָצוֹן מִלְּפָנֶֽיךָ יְיָ אֱלֹהֵֽינוּ וֵאלֹהֵי אֲבוֹתֵֽינוּ, שֶׁבִּזְכוּת סְפִירַת הָעֹֽמֶר שֶׁסָּפַֽרְתִּי הַיּוֹם, יְתֻקַּן מַה שֶּׁפָּגַֽמְתִּי בִּסְפִירָה %@ וְאֶטָּהֵר וְאֶתְקַדֵּשׁ בִּקְדֻשָּׁה שֶׁל מַֽעְלָה, וְעַל יְדֵי זֶה יֻשְׁפַּע שֶֽׁפַע רַב בְּכָל הָעוֹלָמוֹת, וּלְתַקֵּן אֶת נַפְשׁוֹתֵֽינוּ וְרוּחוֹתֵֽינוּ וְנִשְׁמוֹתֵֽינוּ מִכָּל סִיג וּפְגַם, וּלְטַהֲרֵֽנוּ וּלְקַדְּשֵֽׁנוּ בִּקְדֻשָּׁתְךָ הָעֶלְיוֹנָה, אָמֵן סֶֽלָה.", trait];
        
        
        [output appendString:@"\n\n"];
        [output appendString:ribono];
        
    }
    
    if (showAleinu)
    {
        aleinu = @"עָלֵינוּ לְשַׁבֵּחַ לַאֲדוֹן הַכֹּל. לָתֵת גְּדֻלָּה לְיוֹצֵר בְּרֵאשִׁית. שֶׁלֹּא עָשָׂנוּ כְּגוֹיֵי הָאֲרָצוֹת. וְלֹא שָׂמָנוּ כְּמִשְׁפְּחוֹת הָאֲדָמָה. שֶׁלֹּא שָׂם חֶלְקֵנוּ כָּהֶם וְגוֹרָלֵנוּ כְּכָל הֲמוֹנָם. שֶׁהֵם מִשְׁתַּחֲוִים לְהֶבֶל וָרִיק וּמִתְפַּלְלִים אֶל אֵל לֹא יושִׁיעַ וַאֲנַחְנוּ כּוֹרְעִים וּמִשְׁתַּחֲוִים וּמוֹדִים לִפְנֵי מֶלֶךְ מַלְכֵי הַמְּלָכִים הַקָּדושׁ בָּרוּךְ הוּא. שֶׁהוּא נוֹטֶה שָׁמַיִם וְיוֹסֵד אָרֶץ. וּמושַׁב יְקָרוֹ בַּשָּׁמַיִם מִמַּעַל. וּשְׁכִינַת עֻזּו בְּגָבְהֵי מְרוֹמִים. הוּא אֱלהֵינוּ אֵין עוֹד. אֱמֶת מַלְכֵּנוּ. אֶפֶס זוּלָתוֹ. כַּכָּתוּב בְּתוֹרָתוֹ. וְיָדַעְתָּ הַיּום וַהֲשֵׁבֹתָ אֶל לְבָבֶךָ. כִּי ה' הוּא הָאֱלֹהִים בַּשָּׁמַיִם מִמַּעַל וְעַל הָאָרֶץ מִתָּחַת. אֵין עוֹד:\n\nוְעַל כֵּן נְקַוֶּה לְּךָ ה' אֱלהֵינוּ לִרְאוֹת מְהֵרָה בְּתִפְאֶרֶת עֻזֶּךָ. לְהַעֲבִיר גִּלּוּלִים מִן הָאָרֶץ. וְהָאֱלִילִים כָּרוֹת יִכָּרֵתוּן. לְתַקֵּן עוֹלָם בְּמַלְכוּת שַׁדַּי. וְכָל בְּנֵי בָשָׂר יִקְרְאוּ בִשְׁמֶךָ לְהַפְנוֹת אֵלֶיךָ כָּל רִשְׁעֵי אָרֶץ. יַכִּירוּ וְיֵדְעוּ כָּל יושְׁבֵי תֵבֵל. כִּי לְךָ תִּכְרַע כָּל בֶּרֶךְ. תִּשָּׁבַע כָּל לָשׁוֹן. לְפָנֶיךָ ה' אֱלֹהֵינוּ יִכְרְעוּ וְיִפֹּלוּ. וְלִכְבוֹד שִׁמְךָ יְקָר יִתֵּנוּ. וִיקַבְּלוּ כֻלָּם אֶת עֹל מַלְכוּתֶךָ. וְתִמְלךְ עֲלֵיהֶם מְהֵרָה לְעוֹלָם וָעֶד. כִּי הַמַּלְכוּת שֶׁלְּךָ הִיא וּלְעוֹלְמֵי עַד תִּמְלךְ בְּכָבוֹד. כַּכָּתוּב בְּתוֹרָתֶךָ. ה' יִמְלךְ לְעוֹלָם וָעֶד: וְנֶאֱמַר. וְהָיָה ה' לְמֶלֶךְ עַל כָּל הָאָרֶץ. בַּיּום הַהוּא יִהְיֶה ה' אֶחָד וּשְׁמוֹ אֶחָד.";
        
        [output appendString:@"\n\n"];
        [output appendString:aleinu];
    }
    
    return output;
}

#pragma mark - Getting the Kabbalistic Trait of the Day

/**
 *  Converts an integer (between 1 and 49, inclusive)
 *  into a kabbalistic trait traditionally assigned
 *  to a given day of the omer.
 *
 *  @return A string containing the attribure of that day.
 */

- (nullable NSString *)kabbalisticTraitFromInteger:(NSInteger)integer
{
    NSString *trait = nil;
    
    integer = integer - 1;
    
    if (integer < self.hebrewKabbalisticStrings.count)
    {
        trait = self.hebrewKabbalisticStrings[integer];
    }
    
    return trait;
}

#pragma mark - Helpers

/**
 *  Generates a statically allocated map of all of the omer count strings.
 *
 *  @return A multidimensional array of all of the sets of output strings.
 */

- (nonnull NSArray <NSArray <NSString *> *> *)_omerCountStringMap
{
    static NSArray <NSArray <NSString *> *> * omerMap = nil;
    
    if (omerMap == nil)
    {
        omerMap = @[
                    /** Hebrew */
                    @[
                        _ashkenazHebrewStrings,
                        _sefardHebrewStrings,
                        _sephardicHebrewStrings,
                        ],
                    /** English */
                    @[
                        @[_englishStrings]
                        ],
                    /** Transliterated. */
                    @[_ashkenazTransliteratedStrings,
                      _sefardTransliteratedStrings,
                      _sephardicTransliteratedStrings]
                    ];
    }
    
    return omerMap;
}


/**
 *  Generates a statically allocated map of all of the omer count strings.
 *
 *  @return A multidimensional array of all of the sets of output strings.
 */

- (nonnull NSArray <NSArray <NSString *> *> *)_kabbalisticTraitStringMap
{
    static NSArray <NSArray <NSString *> *> * kabbalisticMap = nil;
    
    if (kabbalisticMap == nil)
    {
        kabbalisticMap = @[
                           _englishKabbalisticStrings,
                           _hebrewKabbalisticStrings,
                           _transliteratedHebrewKabbalisticStrings
                           ];
    }
    
    return kabbalisticMap;
}

/** 
 *  Get the blessing text for counting the omer.
 *
 *  @return The blessing said on counting the omer.
 */

- (nonnull NSString *)blessing
{
    return  @"בָּרוּךְ אַתָּה יְיָ אֱלֹהֵֽינוּ מֶֽלֶךְ הָעוֹלָם, אֲשֶׁר קִדְּשָֽׁנוּ בְּמִצְוֹתָיו, וְצִוָּֽנוּ עַל סְפִירַת הָעֹֽמֶר";
}

/**
 *  Check if the given option is enabled.
 *
 *  @returns YES if the options enum contains the supplied option, else false.
 */

- (BOOL)_isFlagEnabled:(KCSefiraPrayerAddition)flag inFlags:(KCSefiraPrayerAddition)flags {
    return (flags & flag) == flag;
}

@end
