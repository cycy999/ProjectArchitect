//
//  HomeViewController.swift
//  ProjectArchitect
//
//  Created by 陈岩 on 2018/5/2.
//  Copyright © 2018年 陈岩. All rights reserved.
//

import UIKit

@objcMembers
class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        view.backgroundColor = UIColor().randomColor()
        
        testButton()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testButton() {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        view.addSubview(button)
        button.backgroundColor = UIColor.white
        //let image = UIImage.animatedImage(with: [UIImage(named: "test_1")!,UIImage(named: "test_2")!,UIImage(named: "test_3")!], duration: 1)
        let image = UIImage.animatedImageNamed("test_", duration: 1)//命名为test_0，test_1，test_2会自动被识别
        button.setImage(image, for: .normal)
    }

}
