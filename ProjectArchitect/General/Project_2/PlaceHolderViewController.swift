//
//  PlaceHolderViewController.swift
//  ProjectArchitect
//
//  Created by 陈岩 on 2018/5/2.
//  Copyright © 2018年 陈岩. All rights reserved.
//

import UIKit

class PlaceHolderViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "占位"
        view.backgroundColor = UIColor().randomColor()
        tableViewAttribute()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
