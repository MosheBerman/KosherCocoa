/**
 *  KCDaf.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 11/13/11.
 *  Updated by Moshe Berman on 9/24/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "KCDaf.h"

@implementation KCDaf

- (id)initWithTractateIndex:(NSInteger)tractateIndex andPageNumber:(NSInteger)number
{
    self = [super init];
    
    if (self)
    {
        _tractateIndex = tractateIndex;
        _pageNumber = number;
    }
    
    return self;
}

- (NSString *)name
{
    NSArray *names = @[@"\u05D1\u05E8\u05DB\u05D5\u05EA", @"\u05E9\u05D1\u05EA", @"\u05E2\u05D9\u05E8\u05D5\u05D1\u05D9\u05DF", @"\u05E4\u05E1\u05D7\u05D9\u05DD", @"\u05E9\u05E7\u05DC\u05D9\u05DD", @"\u05D9\u05D5\u05DE\u05D0", @"\u05E1\u05D5\u05DB\u05D4", @"\u05D1\u05D9\u05E6\u05D4", @"\u05E8\u05D0\u05E9 \u05D4\u05E9\u05E0\u05D4", @"\u05EA\u05E2\u05E0\u05D9\u05EA", @"\u05DE\u05D2\u05D9\u05DC\u05D4",@"\u05DE\u05D5\u05E2\u05D3 \u05E7\u05D8\u05DF", @"\u05D7\u05D2\u05D9\u05D2\u05D4", @"\u05D9\u05D1\u05DE\u05D5\u05EA", @"\u05DB\u05EA\u05D5\u05D1\u05D5\u05EA", @"\u05E0\u05D3\u05E8\u05D9\u05DD", @"\u05E0\u05D6\u05D9\u05E8", @"\u05E1\u05D5\u05D8\u05D4", @"\u05D2\u05D9\u05D8\u05D9\u05DF", @"\u05E7\u05D9\u05D3\u05D5\u05E9\u05D9\u05DF", @"\u05D1\u05D1\u05D0 \u05E7\u05DE\u05D0", @"\u05D1\u05D1\u05D0 \u05DE\u05E6\u05D9\u05E2\u05D0", @"\u05D1\u05D1\u05D0 \u05D1\u05EA\u05E8\u05D0", @"\u05E1\u05E0\u05D4\u05D3\u05E8\u05D9\u05DF", @"\u05DE\u05DB\u05D5\u05EA", @"\u05E9\u05D1\u05D5\u05E2\u05D5\u05EA", @"\u05E2\u05D1\u05D5\u05D3\u05D4 \u05D6\u05E8\u05D4", @"\u05D4\u05D5\u05E8\u05D9\u05D5\u05EA", @"\u05D6\u05D1\u05D7\u05D9\u05DD", @"\u05DE\u05E0\u05D7\u05D5\u05EA", @"\u05D7\u05D5\u05DC\u05D9\u05DF", @"\u05D1\u05DB\u05D5\u05E8\u05D5\u05EA", @"\u05E2\u05E8\u05DB\u05D9\u05DF", @"\u05EA\u05DE\u05D5\u05E8\u05D4", @"\u05DB\u05E8\u05D9\u05EA\u05D5\u05EA", @"\u05DE\u05E2\u05D9\u05DC\u05D4", @"\u05EA\u05DE\u05D9\u05D3", @"\u05E7\u05D9\u05E0\u05D9\u05DD", @"\u05DE\u05D9\u05D3\u05D5\u05EA", @"\u05E0\u05D3\u05D4"];
    
    return names[[self tractateIndex]];
}


- (NSString *)nameTransliterated
{
    NSArray *names = @[@"Berachos", @"Shabbos", @"Eruvin", @"Pesachim", @"Shekalim", @"Yoma", @"Sukkah", @"Beitzah", @"Rosh Hashana", @"Taanis", @"Megillah", @"Moed Katan", @"Chagigah", @"Yevamos", @"Kesubos", @"Nedarim", @"Nazir", @"Sotah", @"Gitin", @"Kiddushin", @"Bava Kamma", @"Bava Metzia", @"Bava Basra", @"Sanhedrin", @"Makkos", @"Shevuos", @"Avodah Zarah", @"Horiyos", @"Zevachim", @"Menachos", @"Chullin", @"Bechoros", @"Arachin", @"Temurah", @"Kerisos", @"Meilah", @"Kinnim", @"Tamid", @"Midos", @"Niddah"];
    
    return names[[self tractateIndex]];
}

@end
