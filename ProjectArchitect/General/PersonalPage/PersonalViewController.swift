//
//  PersonalViewController.swift
//  ProjectArchitect
//
//  Created by 陈岩 on 2018/5/2.
//  Copyright © 2018年 陈岩. All rights reserved.
//

import UIKit

class PersonalViewController: BaseViewController {

    let source = [
        (title: "占位栏1", controller: NSStringFromClass(BaseViewController.self)),
        (title: "占位栏2", controller: NSStringFromClass(BaseViewController.self)),
        (title: "占位栏3", controller: NSStringFromClass(BaseViewController.self)),
        (title: "清除缓存", controller: NSStringFromClass(BaseViewController.self))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor().randomColor()
        tableViewAttribute()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(getSize())
        clearCaches()
    }
    
}

extension PersonalViewController {
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = source[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let className = source[indexPath.row].controller
        if indexPath.row == 3 {
            let vc = PersonalViewController()
            vc.hidesBottomBarWhenPushed = true
            let backBarButtonItem = UIBarButtonItem(title: "haha", style: .plain, target: nil, action: nil)
            navigationItem.backBarButtonItem = backBarButtonItem
            show(vc, sender: nil)
            return
        }
        if let vcType = NSClassFromString(className) {
            let vc = (vcType as! UIViewController.Type).init()
            vc.hidesBottomBarWhenPushed = true
            let backBarButtonItem = UIBarButtonItem(title: "haha", style: .plain, target: nil, action: nil)
            navigationItem.backBarButtonItem = backBarButtonItem
            show(vc, sender: nil)
        }
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
