//
//  UIButton+Extension.swift
//  ProjectArchitect
//
//  Created by 陈岩 on 2018/5/5.
//  Copyright © 2018年 陈岩. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setImageCycle(_ images: [String], duration: TimeInterval) {
        //let image = UIImage.animatedImage(with: [UIImage(named: "test_1")!,UIImage(named: "test_2")!,UIImage(named: "test_3")!], duration: duration)
        let image = UIImage.animatedImageNamed("test_", duration: duration)//命名为test_0，test_1，test_2会自动被识别
        self.setImage(image, for: .normal)
    }
}

