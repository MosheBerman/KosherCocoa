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

#pragma mark - This class isn't finished yet.

@interface KCSefiraFormatter ()

/**  An array of counts in english. */
@property (nonatomic, strong) NSArray *englishStrings;

/** An array of Ashkenaz Hebrew counts. */
@property (nonatomic, strong) NSArray *ashkenazHebrewStrings;

/** An array of Sefard Hebrew counts. */
@property (nonatomic, strong) NSArray *sefardHebrewStrings;

/** An array of Sephardic Hebrew counts. */
@property (nonatomic, strong) NSArray *sephardicHebrewStrings;

/**  An array of Ashkenaz transliterated counts. */
@property (nonatomic, strong) NSArray *ashkenazTransliteratedStrings;

/**  An array of Sefard Transliterated counts. */
@property (nonatomic, strong) NSArray *sefardTransliteratedStrings;

/**  An array of Sephardic transliterated counts. */
@property (nonatomic, strong) NSArray *sephardicTransliteratedStrings;

@end

@implementation KCSefiraFormatter

/**
 *  The designated initializer.
 */

- (id)init
{
    self = [super init];
    if (self) {
        _language = KCSefiraLanguageHebrew; //  Default language is Hebrew
        _custom = KCSefiraCustomSefard;     //  Default custom is Sefard
        
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
        
        _ashkenazTransliteratedStrings = @[
                                           
                                           ];
        _sefardTransliteratedStrings = @[
                                         
                                         ];
        
        _sephardicTransliteratedStrings = @[
                                            
                                            ];
    }
    return self;
}

- (NSString *)countStringFromInteger:(NSInteger)integer withPrayers:(KCSefiraPrayerAdditions)prayers
{
    NSMutableString *output = [NSMutableString stringWithFormat:@""];
    
    if (integer < 0 || integer > 49) {
        return nil;
    }
    
    NSArray *composite = @[
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
    
    NSInteger language = self.language;
    NSInteger custom = self.custom;
    
    /** Ensure we don't out-of-bounds on English. */
    if (language == KCSefiraLanguageEnglish) {
        custom = 0; //  There's only one version of English.
    }
    
    NSString *countText = nil;
    
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
    
    return output;
}

#pragma mark - Helpers

/**
 *  Check if the given option is enabled.
 *
 *  @returns YES if the options enum contains the supplied option, else false.
 */

- (BOOL)_isFlagEnabled:(KCSefiraPrayerAdditions)flag inFlags:(KCSefiraPrayerAdditions)flags {
    return (flags & flag) == flag;
}

@end
