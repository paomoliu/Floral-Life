//
//  MainViewController.swift
//  Floral&Life
//
//  Created by paomoliu on 16/9/22.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()

        addChildViewControllers()
    }
    
    /**
     从JSON文件动态添加子控制器
     */
    private func addChildViewControllers()
    {
        //获取Json文件路径
        let path = NSBundle.mainBundle().pathForResource("MainVCSettings.json", ofType: nil)
        
        if let jsonPath = path {
            let jsonData = NSData(contentsOfFile: jsonPath)
            
            do {
                let dictArr = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers)
                
                for dict in dictArr as! [[String: String]] {
                    addChildViewController(dict["vcName"]!, title: dict["title"]!, index: dict["index"]!)
                }
            } catch {
                print(error)
                addChildViewController("SubjectViewController", title: "专题", index: "0")
                addChildViewController("CommunityViewController", title: "社区", index: "1")
                addChildViewController("MallViewController", title: "商城", index: "2")
                addChildViewController("ProfileViewController", title: "我的", index: "3")
            }
        }
    }
    
    /**
     添加子控制器
     
     - parameter vcName: 子控制器名称
     - parameter title:  子控制器标题
     - parameter index:  子控制器tabbar对应index
     */
    private func addChildViewController(vcName: String, title: String, index: String)
    {
        //动态获取命名空间
//        let nameSpace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        let nameSpace = "Floral_Life"
        
        //根据命名空间获取对应类
        let cls: AnyClass! = NSClassFromString(nameSpace + "." + vcName)
        let vcCls = cls as! UIViewController.Type
        let vc = vcCls.init()
        
        vc.title = title
        vc.tabBarItem.image = UIImage(named: "tb_\(index)_30x30_")
        vc.tabBarItem.selectedImage = UIImage(named: "tb_\(index)_s_30x30_")
        let nav = UINavigationController(rootViewController: vc)
        
        addChildViewController(nav)
    }
}
