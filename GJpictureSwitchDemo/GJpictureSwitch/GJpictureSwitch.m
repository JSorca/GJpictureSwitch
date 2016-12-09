//
//  GJpictureSwitch.m
//  GJpictureSwitchDemo
//
//  Created by Zhanggaoju on 2016/12/9.
//  Copyright © 2016年 Zhanggaoju. All rights reserved.
//

#import "GJpictureSwitch.h"

@implementation GJpictureSwitch

/**
 *
 *  保存图片到沙盒文件
 *
 */
+(void)saveImageDocuments:(UIImage *)image{
    //拿到图片
    UIImage *imagesave = image;
    NSString *path_sandox = NSHomeDirectory();
    //设置一个图片的存储路径
    NSString *imagePath = [path_sandox stringByAppendingString:@"/Documents/test.png"];
    //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
    [UIImagePNGRepresentation(imagesave) writeToFile:imagePath atomically:YES];
}

/**
 *
 *  从沙盒文件读取图片
 *
 */
+(UIImage *)getDocumentImage{
    // 读取沙盒路径图片
    NSString *aPath=[NSString stringWithFormat:@"%@/Documents/%@.png",NSHomeDirectory(),@"test"];
    // 拿到沙盒路径图片
    UIImage *imgFromUrl=[[UIImage alloc]initWithContentsOfFile:aPath];
    return imgFromUrl;
    
}


/**
 *
 *  从沙盒文件读取图片并存贮到相册
 *
 */
+(UIImage *)getDocumentImageSavePhotoAlbum{
    // 读取沙盒路径图片
    NSString *aPath=[NSString stringWithFormat:@"%@/Documents/%@.png",NSHomeDirectory(),@"test"];
    // 拿到沙盒路径图片
    UIImage *imgFromUrl=[[UIImage alloc]initWithContentsOfFile:aPath];
    // 图片保存相册
    UIImageWriteToSavedPhotosAlbum(imgFromUrl, self, nil, nil);
    return imgFromUrl;
}

@end
