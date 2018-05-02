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
let root_url = "root_url_dev"
#else
let verisons = "this is a normal environment"
let root_url = "root_url"
#endif

let screen: UIScreen = UIScreen.main
let DEVICE_RECT: CGRect = screen.bounds
let DEVICE_WIDTH: CGFloat = DEVICE_RECT.width
let DEVICE_HEIGHT: CGFloat = DEVICE_RECT.height

let APPDelegatePro = ((UIApplication.shared.delegate) as! AppDelegate)

