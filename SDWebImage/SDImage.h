//
//  SDImage.h
//  SDWebImage
//
//  Created by Nihal on 2015-11-17.
//  Copyright © 2015 Dailymotion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDWebImageCompat.h"

/**
 * SDImage represents the downloaded image either as a UIImage or raw NSData.
 */
@interface SDImage : NSObject

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithImage:(UIImage *)image NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithImageData:(NSData *)imageData NS_DESIGNATED_INITIALIZER;

@property (nonatomic, strong, readonly) UIImage *image;
@property (nonatomic, copy, readonly) NSData *imageData;
@property (nonatomic, readonly) BOOL isGIF;

@end

// LOL