//
//  AppDelegate.swift
//  ProjectArchitect
//
//  Created by 陈岩 on 2018/5/2.
//  Copyright © 2018年 陈岩. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var mainViewController: MainViewController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        print(versions, ROOT_URL)
        setGlobalParameter()
        fileManager()
        
        window = UIWindow(frame: DEVICE_RECT)
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

//MARK: - 全局设置参数
extension AppDelegate {
    func setGlobalParameter() {
        //导航条背景色
        UINavigationBar.appearance().barTintColor = UIColor.getColor("45b173").withAlphaComponent(0.5)

        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.white//文字和图标变成白色
        ]
        UINavigationBar.appearance().isTranslucent = true//导航条透明开关
        
        UIBarButtonItem.appearance().setTitleTextAttributes([
            NSAttributedStringKey.foregroundColor: UIColor.white.withAlphaComponent(0.5),
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)
            ], for: .disabled)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)], for: .highlighted)
    }
}

//MARK: - 创建相关缓存文件夹
extension AppDelegate {
    func fileManager() {
        DispatchQueue.global().async {
            if !FilesPath().isExitFile(path: cacheFilesPath) {
                do {
                    try FileManager.default.createDirectory(atPath: cacheFilesPath, withIntermediateDirectories: true, attributes: nil)
                } catch {
                    print("创建失败")
                }
            }
            if !FilesPath().isExitFile(path: cacheImagesPath) {
                do {
                    try FileManager.default.createDirectory(atPath: cacheImagesPath, withIntermediateDirectories: true, attributes: nil)
                } catch {
                    print("创建失败")
                }
            }
        }
    }
}
