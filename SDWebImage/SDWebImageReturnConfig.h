//
//  SDWebImageReturnConfig.h
//  SDWebImage
//
//  Created by Nihal on 2015-11-17.
//  Copyright © 2015 Dailymotion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SDWebImageReturnConfig : NSObject

/**
 * If YES, NSData will be returned instead of UIImage for GIFs.
 */
@property (nonatomic) BOOL returnDataForGIFs;

@end
