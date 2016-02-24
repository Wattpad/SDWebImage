/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * Created by james <https://github.com/mystcolor> on 9/28/11.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "SDWebImageDecoder.h"

@implementation UIImage (ForceDecode)

+ (UIImage *)decodedImageWithImage:(UIImage *)image {
    if (image.images) {
        // Do not decode animated images
        return image;
    }

    CGImageRef imageRef = image.CGImage;
    CGSize imageSize = CGSizeMake(CGImageGetWidth(imageRef), CGImageGetHeight(imageRef));
    CGRect imageRect = (CGRect){.origin = CGPointZero, .size = imageSize};

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(imageRef);

    if (CGColorSpaceGetNumberOfComponents(colorSpace) > 1) {
        // Specifying byte order does not appear to be supported on iOS, and the
        // recommended component order for RGB is with alpha first, so we can
        // discard everything except whether it uses an alpha channel or not.
        int infoMask = (bitmapInfo & kCGBitmapAlphaInfoMask);
        BOOL hasAlpha = (infoMask != kCGImageAlphaNone &&
                         infoMask != kCGImageAlphaNoneSkipFirst &&
                         infoMask != kCGImageAlphaNoneSkipLast);
        bitmapInfo = (CGBitmapInfo)(hasAlpha ? kCGImageAlphaPremultipliedFirst : kCGImageAlphaNoneSkipFirst);
    }

    // There's no point using 16 bits per component or higher
    size_t bitsPerComponent = CGImageGetBitsPerComponent(imageRef);
    if (bitsPerComponent > 8) {
        bitsPerComponent = 8;
    }

    // iOS does not support floating point components or specifying byte order
    bitmapInfo &= ~(kCGBitmapFloatComponents | kCGBitmapByteOrderMask);

    // It calculates the bytes-per-row based on the bitsPerComponent and width arguments.
    CGContextRef context = CGBitmapContextCreate(NULL,
            imageSize.width,
            imageSize.height,
            bitsPerComponent,
            0,
            colorSpace,
            bitmapInfo);
    CGColorSpaceRelease(colorSpace);

    // If failed, return undecompressed image
    if (!context) return image;

    CGContextDrawImage(context, imageRect, imageRef);
    CGImageRef decompressedImageRef = CGBitmapContextCreateImage(context);

    CGContextRelease(context);

    UIImage *decompressedImage = [UIImage imageWithCGImage:decompressedImageRef scale:image.scale orientation:image.imageOrientation];
    CGImageRelease(decompressedImageRef);
    return decompressedImage;
}

@end
