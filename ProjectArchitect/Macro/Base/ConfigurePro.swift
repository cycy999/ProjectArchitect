//
//  ConfigurePro.swift
//  ProjectArchitect
//
//  Created by 陈岩 on 2018/5/2.
//  Copyright © 2018年 陈岩. All rights reserved.
//
import UIKit

#if DEVELOPMENT
let versions = "this is a dev environment"
let ROOT_URL = "root_url_dev"
#else
let versions = "this is a normal environment"
let ROOT_URL = "root_url"
#endif

let screen: UIScreen = UIScreen.main
let DEVICE_RECT: CGRect = screen.bounds
let DEVICE_WIDTH: CGFloat = DEVICE_RECT.width
let DEVICE_HEIGHT: CGFloat = DEVICE_RECT.height

let APPDelegatePro = ((UIApplication.shared.delegate) as! AppDelegate)

let PROJECT_STUFF_DIR="project_stuff" //项目stuff文件存储路径
let ATTACHMENT_DIR="attachment"
let SOUND_DIR="sound"
let CACHE_DIR="cache"

let documentPath = FilesPath().getDocument()
let cacheFilesPath = FilesPath().getCache() + "/files"
let cacheImagesPath = FilesPath().getCache() + "/images"
let tmpPath = FilesPath().getTmp()
