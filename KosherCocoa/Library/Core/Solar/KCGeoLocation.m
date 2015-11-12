/**
 *  KCGeolocation.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 3/22/11.
 *  Updated by Moshe Berman on 10/8/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "KCGeoLocation.h"
#import "trigonometry.h"

@interface KCGeoLocation ()

@end

@implementation KCGeoLocation


/*
 *
 * An initializer with parameters for all required fields,
 * except for elevation, which is set to zero.
 *
 */

- (id)initWithLatitude:(double)latitude andLongitude:(double)longitude andTimeZone:(NSTimeZone *)timeZone
{
    return [self initWithName:@"Unspecified Location" andLatitude:latitude andLongitude:longitude andElevation:0 andTimeZone:timeZone];
}

/**
 *  This method insantiates a new KCGeoLocation.
 *
 *  @param latitude The latitude that the location represents.
 *  @param longitude The longitude that the location represents.
 *  @param elevation The altitude that the location represents.
 *  @param timezone The time zone that the location represents.
 *
 *  @return A configured KCGeoLocation instance.
 */

- (id)initWithLatitude:(double)latitude andLongitude:(double)longitude elevation:(double)elevation  andTimeZone:(NSTimeZone *)timezone
{
    return [self initWithName:@"Unspecified Location" andLatitude:latitude andLongitude:longitude andElevation:elevation andTimeZone:timezone];
}

/*
 *
 * An initializer with parameters for all required fields,
 * except for elevation, which is set to zero.
 *
 */

- (id)initWithName:(NSString *)name andLatitude:(double)latitude andLongitude:(double)longitude andTimeZone:(NSTimeZone *)timeZone
{
    return [self initWithName:name andLatitude:latitude andLongitude:longitude andElevation:0 andTimeZone:timeZone];
}

/*
 *
 *  An initializer with parameters for all required fields.
 *
 */

- (id)initWithName:(NSString *)name andLatitude:(double)latitude andLongitude:(double)longitude andElevation:(double)elevation andTimeZone:(NSTimeZone *)timeZone
{
    self = [super init];
    
    if(self)
    {
        _locationName = name;
        _longitude = longitude;
        _latitude = latitude;
        _altitude = elevation;
        _timeZone = timeZone;
    }
    
    return self;
}

/*
 *
 *  A default initializer which will set the location
 *  to the Prime Meridian at Greenwich, England.
 *
 *
 */

- (id)init
{
    self = [super init];
    
    if(self){
        [self setLocationName:@"Greenwich, England"];
        [self setLongitude:0];  //EH: added for clarity
        [self setLatitude:51.4772];
        [self setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    }
    
    return self;
}

/*
 *
 *  Method to set the latitude in degrees, minutes and seconds.
 *
 */

- (void)setLatitudeWithDegrees:(int)_degrees andMinutes:(int)_minutes andSeconds:(double)_seconds inDirection:(NSString *)_direction
{
    double tempLat = _degrees + ((_minutes + (_seconds / 60.0)) / 60.0);
    
    if (tempLat > 90 || tempLat < 0)
    {
        @throw [NSException exceptionWithName:@"IllegalArgumentException" reason:@"Latitude must be between 0 and 90. USe direction of S instead of negative." userInfo:nil];
    }
    
    if ([_direction isEqualToString:@"S"])
    {
        tempLat = tempLat * -1;
    }
    else if(! [_direction isEqualToString:@"N"])
    {
        @throw [NSException exceptionWithName:@"IllegalArgumentException" reason:@"Latitude direction must be N or S." userInfo:nil];
    }
    
    [self setLatitude:tempLat];
}

/*
 *
 *  Set the longitude in degrees, minutes and seconds.
 *
 */

- (void)setLongitudeWithDegrees:(int)_degrees andMinutes:(int)_minutes andSeconds:(double)_seconds inDirection:(NSString *)_direction{
    
    double longTemp = _degrees + ((_minutes + (_seconds / 60.0)) / 60.0);
    
    if(longTemp > 180 || longTemp < 0)
    {
        @throw [NSException exceptionWithName:@"IllegalArgumentException" reason:@"Longitude must be between 0 and 180. Use the direction of W instead of negative." userInfo:nil];
    }
    
    if ([_direction isEqualToString:@"W"])
    {
        longTemp = longTemp * -1;
    }
    else if(![_direction isEqualToString:@"E"])
    {
        @throw [NSException exceptionWithName:@"IllegalAergumentException" reason:@"Longitude direction must be E or W" userInfo:nil];
    }
    
    [self setLongitude:longTemp];
    
}

/* -------------------------- Calculation Methods ------------------------------ */

/*
 *
 *  A method that will return the location's local mean time offset in
 *  milliseconds from local standard time. The globe is split into 360&deg;,
 *  with 15&deg; per hour of the day. For a local that is at a longitude that
 *  is evenly divisible by 15 (longitude % 15 == 0), at solar noon.
 *
 *
 *
 *
 */

#define kMillisecondsInAMinute 60 * 1000

- (long)localMeanTimeOffset
{
    return (long)[self longitude] * 4 * kMillisecondsInAMinute - ([[self timeZone] secondsFromGMT] * 1000);
}

/**
 *
 *  @param location An instance of KCGeoLocation.
 *
 *  @return The geodesic bearing for the location.
 */

- (double)getGeodesicInitialBearingForLocation:(KCGeoLocation *)location
{
    return [self vincentyFormulaForLocation:location withBearing:kInitialBearing];
}

/*
 *
 */

- (double)getGeodesicFinalBearingForLocation:(KCGeoLocation *)location
{
    return [self vincentyFormulaForLocation:location withBearing:kFinalBearing];
}

/*
 *
 */

- (double)getGeodesicDistanceForLocation:(KCGeoLocation *)location
{
    return [self vincentyFormulaForLocation:location withBearing:kDistance];
}

/*
 *
 */

- (double)vincentyFormulaForLocation:(KCGeoLocation *)location withBearing:(int)formula
{
    double a = 6378137;
    double b = 6356752.3142;
    double f = 1 / 298.257223563;  // WGS-84 ellipsiod
    double L = toRadians(location.longitude -  [self longitude]);
    double U1 = atan((1 - f) * tan(toRadians([self latitude])));
    double U2 = atan((1 - f)
                     * tan(toRadians([location latitude])));
    double sinU1 = sin(U1), cosU1 = cos(U1);
    double sinU2 = sin(U2), cosU2 = cos(U2);
    
    double lambda = L;
    double lambdaP = 2 * M_PI;
    double iterLimit = 20;
    double sinLambda = 0;
    double cosLambda = 0;
    double sinSigma = 0;
    double cosSigma = 0;
    double sigma = 0;
    double sinAlpha = 0;
    double cosSqAlpha = 0;
    double cos2SigmaM = 0;
    double C;
    while (fabs(lambda - lambdaP) > 1e-12 && --iterLimit > 0)
    {
        sinLambda = sin(lambda);
        cosLambda = cos(lambda);
        sinSigma = sqrt((cosU2 * sinLambda) * (cosU2 * sinLambda)
                        + (cosU1 * sinU2 - sinU1 * cosU2 * cosLambda)
                        * (cosU1 * sinU2 - sinU1 * cosU2 * cosLambda));
        if (sinSigma == 0)
            return 0; // co-incident points
        cosSigma = sinU1 * sinU2 + cosU1 * cosU2 * cosLambda;
        sigma = atan2(sinSigma, cosSigma);
        sinAlpha = cosU1 * cosU2 * sinLambda / sinSigma;
        cosSqAlpha = 1 - sinAlpha * sinAlpha;
        cos2SigmaM = cosSigma - 2 * sinU1 * sinU2 / cosSqAlpha;
        //Check if this is correct
        if (isnan(cos2SigmaM)){
            cos2SigmaM = 0; // equatorial line: cosSqAlpha=0 (ß6)
        }
        C = f / 16 * cosSqAlpha * (4 + f * (4 - 3 * cosSqAlpha));
        lambdaP = lambda;
        lambda = L
        + (1 - C)
        * f
        * sinAlpha
        * (sigma + C
           * sinSigma
           * (cos2SigmaM + C * cosSigma
              * (-1 + 2 * cos2SigmaM * cos2SigmaM)));
    }
    
    if (iterLimit == 0)
    {
        return NAN; // formula failed to converge
    }
    
    double uSq = cosSqAlpha * (a * a - b * b) / (b * b);
    double A = 1 + uSq / 16384
    * (4096 + uSq * (-768 + uSq * (320 - 175 * uSq)));
    double B = uSq / 1024 * (256 + uSq * (-128 + uSq * (74 - 47 * uSq)));
    double deltaSigma = B
    * sinSigma
    * (cos2SigmaM + B
       / 4
       * (cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM) - B
          / 6 * cos2SigmaM
          * (-3 + 4 * sinSigma * sinSigma)
          * (-3 + 4 * cos2SigmaM * cos2SigmaM)));
    double distance = b * A * (sigma - deltaSigma);
    
    // initial bearing
    double fwdAz = toDegrees(atan2(cosU2 * sinLambda, cosU1
                                   * sinU2 - sinU1 * cosU2 * cosLambda));
    // final bearing
    double revAz = toDegrees(atan2(cosU1 * sinLambda, -sinU1
                                   * cosU2 + cosU1 * sinU2 * cosLambda));
    if (formula == kDistance)
    {
        return distance;
    }
    else if (formula == kInitialBearing)
    {
        return fwdAz;
    }
    else if (formula == kFinalBearing)
    {
        return revAz;
    }
    else
    {
        return NAN;
    }
}

/*
 *
 */

- (double)getRhumbLineBearingForLocation:(KCGeoLocation *)location
{
    double dLon = toRadians([location longitude] - [self longitude]);
    double dPhi = log(tan(toRadians([location latitude])
                          / 2 + M_PI / 4)
                      / tan(toRadians([self latitude]) / 2 + M_PI / 4));
    if (fabs(dLon) > M_PI){
        dLon = dLon > 0 ? -(2 * M_PI - dLon) : (2 * M_PI + dLon);
    }
    return toDegrees(atan2(dLon, dPhi));
}

/*
 *
 */

- (double)getRhumbLineDistanceForLocation:(KCGeoLocation *)location
{
    
    double R = 6371;  // earth's mean radius in km
    double dLat = toRadians([location latitude] - _latitude);
    double dLon = toRadians(fabs([location longitude ]
                                - [self longitude]));
    double dPhi = log(tan(toRadians([location longitude])
                          / 2 + M_PI / 4)
                      / tan(toRadians([self latitude]) / 2 + M_PI / 4));
    double q = (fabs(dLat) > 1e-10) ? dLat / dPhi : cos(toRadians(_latitude));
    // if dLon over 180∞ take shorter rhumb across 180∞ meridian:
    if (dLon > M_PI)
    {
        dLon = 2 * M_PI - dLon;
    }
    double d = sqrt(dLat * dLat + q * q * dLon * dLon);
    
    return d * R;
}

- (NSString *)description
{
    
    return [NSString stringWithFormat:@"<GeoLocation:> ----\nName: %@ \nLatitude: %f, \nLongitude: %f \nAltitude: %f", self.locationName, self.latitude, self.longitude, self.altitude];
}

@end
