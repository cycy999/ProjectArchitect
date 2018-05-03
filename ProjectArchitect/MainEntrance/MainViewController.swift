//
//  MainViewController.swift
//  ProjectArchitect
//
//  Created by 陈岩 on 2018/5/2.
//  Copyright © 2018年 陈岩. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        test_config_nav()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

//MARK: - init Navigation
extension MainViewController {
    
    func test_config_nav() {
        config_nav()
        //config_navs()
        
    }
    
    //测试代码
    func config_navs() {
        let homePage = HomeViewController()
        homePage.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        let homeNav = UINavigationController(rootViewController: homePage)
        
        let placeHolderPage = PlaceHolderViewController()
        placeHolderPage.tabBarItem = UITabBarItem(title: "占位", image: nil, tag: 1)
        placeHolderPage.tabBarItem.setBadgeTextAttributes([NSAttributedStringKey.foregroundColor.rawValue: UIColor.getColor("45b173")], for: .normal)
        let placeHolderNav = UINavigationController(rootViewController: placeHolderPage)
        
        let personalPage = PersonalViewController()
        let personalNav = UINavigationController(rootViewController: personalPage)
        personalNav.tabBarItem = UITabBarItem(title: "个人", image: nil, tag: 2)
        
        var kItem: UITabBarItem!

        let k = PersonalViewController()
        kItem = UITabBarItem(title: "知识库",
                             image: UIImage(named: "common_contact_n")?.withRenderingMode(.alwaysOriginal),
                             selectedImage: UIImage(named: "common_contact_s")?.withRenderingMode(.alwaysOriginal))
        kItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.getColor("45b173")],
                                     for: .selected)
        kItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.getColor("dbdee2")], for: .normal)
        kItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        k.tabBarItem = kItem
        
        let rNav = UINavigationController(rootViewController: k)
        rNav.view.backgroundColor = UIColor.white
        rNav.navigationBar.barStyle = .black
        
        viewControllers = [
            homeNav,
            placeHolderNav,
            personalNav,
            rNav
        ]
    }
    
    /*推荐的模式，更加灵活些*/
    /*TabBarController的viewControllers + 多个NavigatioController 设计模式*/
    func config_nav() {
        addChildVc(HomeViewController(), title: "首页", image: "tab_work_nor", selectedImage: "tab_work_pre")
        addChildVc(PlaceHolderViewController(), title: "占位1", image: "common_founder_n", selectedImage: "common_founder_s")
        addChildVc(PlaceHolderViewController(), title: "占位2", image: "common_founder_n", selectedImage: "common_founder_s")
        addChildVc(PersonalViewController(), title: "个人", image: "common_me_n", selectedImage: "common_me_s")
    }
    
    func addChildVc(_ childVC: UIViewController, title: String, image: String, selectedImage: String) {
        /*在此设置 title 如果和 childVC 的 title 冲突，
         则在 childVC 未跳到当前页时，以当前位置的 title 为主显示；
         如果跳到页面后，则以 childVC 文件中的 title 为主显示，
         以后也会以此显示（tabbarItem的title，navItem的title 都会改变）*/
        childVC.title = title
        /*设置tabbarItem的 title 的默认和被选中颜色*/
        //childVC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.getColor("dbdee2")], for: .normal)
        childVC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.getColor("45b173")], for: .selected)
        childVC.tabBarItem.image = UIImage(named: image)//?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)//向上偏移2个像素
        let nav = UINavigationController(rootViewController: childVC)
        nav.view.backgroundColor = UIColor.white
        nav.navigationBar.barStyle = .default //共四种样式，default默认白色半透明，后三种差别不大 （black、blackOpaque、blackTranslucent）
        addChildViewController(nav)
    }
    
    /*
     TabBarController的viewControllers + 一个NavigationController 设计模式
     
     AppDelegate.m
     
     TabBarController *tabVC = [[TabBarController alloc]init];
     //全局就这一个导航控制器
     UINavigationController *nav =[[UINavigationController alloc] initWithRootViewController:tabVC];
     self.window.rootViewController = nav;
     
     TabBarController.m
     
     - (void)viewDidLoad {
     [super viewDidLoad];
     [self addChildVc:[[ChatViewController alloc] init] title:@"Chat" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
     [self addChildVc:[[ContactsListViewController alloc] init] title:@"Contact" image:@"tabbar_contacts" selectedImage:@"tabbar_contacts_selected"];
     [self addChildVc:[[MoreViewController alloc] init] title:@"More" image:@"tabbar_more" selectedImage:@"tabbar_more_selected"];
     [self addChildVc:[[ProfileViewController alloc] init] title:@"Profile" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
     }
     */
}

extension MainViewController {
    
}
