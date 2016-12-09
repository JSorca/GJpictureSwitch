//
//  GJpictureSwitch.h
//  GJpictureSwitchDemo
//
//  Created by Zhanggaoju on 2016/12/9.
//  Copyright © 2016年 Zhanggaoju. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GJpictureSwitch : NSObject

/**
 *
 *  保存图片到沙盒文件
 *
 */
+(void)saveImageDocuments:(UIImage *)image;

/**
 *
 *  从沙盒文件读取图片
 *
 */
+(UIImage *)getDocumentImage;


/**
 *
 *  从沙盒文件读取图片并存贮到相册
 *
 */
+(UIImage *)getDocumentImageSavePhotoAlbum;

@end
