//
//  SDImage.m
//  SDWebImage
//
//  Created by Nihal on 2015-11-17.
//  Copyright © 2015 Dailymotion. All rights reserved.
//

#import "SDImage.h"
#import "NSData+ImageContentType.h"

@implementation SDImage

- (instancetype)initWithImage:(UIImage *)image {
    NSParameterAssert(image != nil);
    self = [super init];
    if (self) {
        _image = image;
        _isGIF = image.images.count > 0;
    }
    return self;
}

- (instancetype)initWithImageData:(NSData *)imageData {
    NSParameterAssert(imageData != nil);
    self = [super init];
    if (self) {
        _imageData = [imageData copy];
        _isGIF = [NSData sd_isContentTypeGIFForImageData:imageData];
    }
    return self;
}

@end
