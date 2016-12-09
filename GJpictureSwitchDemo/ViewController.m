//
//  ViewController.m
//  GJpictureSwitchDemo
//
//  Created by Zhanggaoju on 2016/12/9.
//  Copyright © 2016年 Zhanggaoju. All rights reserved.
//

#import "ViewController.h"
#import "GJpictureSwitch.h"

@interface ViewController ()<UIGestureRecognizerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong) UIImageView *bgImageView;

@property (nonatomic,strong) UIImage *bgImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}
-(void)initUI{
    _bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    
    _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    _bgImageView.clipsToBounds = YES;
    [self.view addSubview:_bgImageView];
    
    // 给图片添加轻拍手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTap:)];
    // 允许用户交互
    _bgImageView.userInteractionEnabled = YES;
    
    [_bgImageView addGestureRecognizer:tap];
    
    //使用说明和步骤
    UITextView *stepsTv=[[UITextView alloc]initWithFrame:CGRectMake(20, 300, self.view.bounds.size.width-40, 260)];
    stepsTv.text=@"GJpictureSwitch使用介绍: \n点击图片->进入相册选择图片-> 返回完成自定义背景图片设置. \n1.把GJpictureSwitch文件夹拖到自己的项目中. \n2.在需要的地方调用.  \n注意:去info.plist设置相册访问权限.";
    stepsTv.scrollEnabled = NO;
    stepsTv.editable = NO;
    stepsTv.font = [UIFont systemFontOfSize:18];
    stepsTv.textColor=[UIColor redColor];
    [self.view addSubview:stepsTv];
    
    
}
// 点击头像进入系统相册
- (void)doTap:(NSString *)str{
    UIImagePickerController *imagePick = [[UIImagePickerController alloc]init];
    // 设置图片来源
    imagePick.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    imagePick.delegate = self;
    imagePick.allowsEditing = YES;
    // 进入系统相册
    [self presentViewController:imagePick animated:YES completion:nil];
}

#pragma mask -UIImagePickerControllerDelegate, UINavigationControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo{
    
    //把相册取出的图片存进沙盒
    [GJpictureSwitch saveImageDocuments:image];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 拿到沙盒路径图片
    _bgImage=[GJpictureSwitch getDocumentImage];
    if (_bgImage) {
        _bgImageView.image = _bgImage;
    }else{
        _bgImageView.image = [UIImage imageNamed:@"pic"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
