//
// Created by Fabrice Aneche on 06/01/14.
// Copyright (c) 2014 Dailymotion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (ImageContentType)

/**
 *  Compute the content type for an image data
 *
 *  @param data the input data
 *
 *  @return the content type as string (i.e. image/jpeg, image/gif)
 */
+ (NSString *)sd_contentTypeForImageData:(NSData *)data;

/**
 *  Check if the content type for the image data is image/gif
 *
 *  @param data the input data
 *
 *  @return YES if the content type is image/gif
 */
+ (BOOL)sd_isContentTypeGIFForImageData:(NSData *)data;

@end


@interface NSData (ImageContentTypeDeprecated)

+ (NSString *)contentTypeForImageData:(NSData *)data __deprecated_msg("Use `sd_contentTypeForImageData:`");

@end
