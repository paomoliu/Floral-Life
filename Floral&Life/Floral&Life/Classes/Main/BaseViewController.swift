//
//  BaseViewController.swift
//  Floral&Life
//
//  Created by paomoliu on 16/9/22.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func leftAction()
    {
        Tools.printLog("")
    }
    
    func rightAction()
    {
        Tools.printLog("")
    }
    
    func setNavigationBar(leftImageName: String, rightImagesName: [String])
    {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: leftImageName), style: UIBarButtonItemStyle.Plain, target: self, action: "leftAction")
        
        var rightBtnArr: [UIBarButtonItem] = [UIBarButtonItem]()
        for imageName in rightImagesName as [String] {
            let btn = UIBarButtonItem(image: UIImage(named: imageName), style: UIBarButtonItemStyle.Plain, target: self, action: "rightAction")
            rightBtnArr.append(btn)
        }
        navigationItem.rightBarButtonItems = rightBtnArr
    }
}
