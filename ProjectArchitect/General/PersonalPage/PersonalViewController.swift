//
//  PersonalViewController.swift
//  ProjectArchitect
//
//  Created by 陈岩 on 2018/5/2.
//  Copyright © 2018年 陈岩. All rights reserved.
//

import UIKit

class PersonalViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor().randomColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(getSize())
        clearCaches()
    }
}
//MARK: - 清除缓存
extension PersonalViewController {
    func getSize() -> String {
        guard URL(string: cacheFilesPath) != nil else { return "" }
        
        var sizeInBytes: UInt64 = 0
        let filesPath = FilesPath()
        
        sizeInBytes = filesPath.getSizePath(path: cacheFilesPath)
        sizeInBytes += filesPath.getSizePath(path: tmpPath)
        
        //sizeInBytes += UInt64(SDImageCache.shared().getSize())//加入SDWebImage的缓存文件大小

        let b = ByteCountFormatter()
        b.allowedUnits = .useMB
        b.countStyle = .file
        
        let sizeString = b.string(fromByteCount: Int64(sizeInBytes))
        return sizeString
    }
    
    func clearCaches() {
        //SDWebImage清楚缓存
        //SDImageCache.shared().clearDisk()
        //SDImageCache.shared().clearMemory()
        
        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.default)
        
        queue.async {
            let fileManager = FileManager.default
            do {
                var paths = [URL]()
                if let url = URL(string: cacheFilesPath) {
                    paths.append(url)
                }
                if let url = URL(string: tmpPath) {
                    paths.append(url)
                }
                if paths.count == 0 {
                    print("操作失败")
                }
                
                for path in paths {
                    let fileUrls = try fileManager.contentsOfDirectory(at: path, includingPropertiesForKeys: nil, options: [])
                    for fileUrl in fileUrls {
                        try fileManager.removeItem(at: fileUrl)
                    }
                }
                DispatchQueue.main.async {
                    print("操作成功")
                }
            } catch {
                DispatchQueue.main.async {
                    print("操作失败")
                }
            }
        }
    }
}
