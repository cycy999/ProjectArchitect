//
//  Readme.swift
//  ProjectArchitect
//
//  Created by 陈岩 on 2018/5/2.
//  Copyright © 2018年 陈岩. All rights reserved.
//

/*
 1、MainEntrance: app主要流程入口
 2、PodspecMetadata:一些配置文件
 3、Macro:基类、请求类、公共类等集合文件夹
    {
    Base、
    Category、
    Public
    }
 4、General: 项目模块
    {
    LoginAndRegister、
    Project_1、
    Project_x、
    ...
    }
 5、SupportingFiles:选择without foulder生成虚拟文件夹
    工程自动生成文件，如桥连接文件等
 */

/*
 多target管理工程
 1.在主工程target下右键，选择Duplicate复制一个配置完全一样的target；
 2.更改 target 名称：
    (1).双击当前target至编辑模式，更改名称；
    (2).Manager Schemes下找到对应target,回车进入编辑模式，更改名；
    (3).更改新target下的info.plist路径。新的target下 -> Build Setting -> packaging -> Info.plist File；
    (4).Bundle Identifier 需要不一样
 3.设置全局 target 宏：       参考：https://www.jianshu.com/p/ed3abd649020
    由于 Swift 项目，编译器不再支持预处理指令了。相对地，它使用了运行期属性(compile-time attributes)和构建配置。为了增加开发版构建的标志，选择开发 target。来到 Build Settings，向下滚动到 Swift Compiler - Custom Flags 小节。设置值为 -DDEVELOPMENT 来表明当前为 target 为开发版
 */

/**
 设置app启动页：
 1、在assets.xcassets添加新的App Icons & Launch Images -> New iOS Launch Image
 2、选中新的 LaunchImage 打开右侧操作栏，选中 iPhone 选项,把启动图放上去
 3、将 Launch Screen File 置空
 4、新生成一个新的Launch Images Source,在将新的删除，即可将Launch Images Source 设置为 LaunchImage
 (若想延长启动图的时间，可在 rootViewController 的 viewDidLoad 中 睡眠几秒：如：hread.sleep(forTimeInterval: 5.0))
 */

