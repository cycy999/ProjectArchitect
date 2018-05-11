//
//  BaseViewController.swift
//  ProjectArchitect
//
//  Created by 陈岩 on 2018/5/2.
//  Copyright © 2018年 陈岩. All rights reserved.
//

import UIKit

@objcMembers
class BaseViewController: UIViewController {

    lazy var id = ""
    lazy var titleName = ""

    var tableView:UITableView!

    var navController: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

//MARK: - navigationBar返回按钮设置
extension BaseViewController {
    
    func leftBarButtonItem(_ image: String = "") {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: image), style: .plain, target: self, action: #selector(back))
    }
    
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func pushNextController(_ controller: UIViewController, backBarTitle: String = "", backBarImage: String = "") {
        let backBarButtonItem = UIBarButtonItem(title: backBarTitle, style: .plain, target: nil, action: nil)
        backBarButtonItem.setBackgroundImage(UIImage(named: backBarImage), for: .normal, barMetrics: .default)
        navigationItem.backBarButtonItem = backBarButtonItem
        show(controller, sender: nil)
    }
}

extension BaseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableViewAttribute() {
        if tableView == nil {
            tableView = UITableView(frame: self.view.bounds, style: .plain)
        }
        view.addSubview(tableView)
        tableView.delegate            = self
        tableView.dataSource          = self
        tableView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.onDrag
        tableView.backgroundColor     = UIColor.viewBackGroundColor()
        tableView.tableFooterView     = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = "\(indexPath.row)"
        return cell!
    }
}
