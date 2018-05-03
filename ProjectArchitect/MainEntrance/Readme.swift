//
//  Readme.swift
//  ProjectArchitect
//
//  Created by 陈岩 on 2018/5/2.
//  Copyright © 2018年 陈岩. All rights reserved.
//

import UIKit

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
class Readme: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
