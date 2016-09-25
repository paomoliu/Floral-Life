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
    
    func leftAction(btn: UIBarButtonItem)
    {
    }
    
    func rightAction(btn: UIBarButtonItem)
    {
    }
    
    func setNavigationBar(leftImageName: String, rightImagesName: [String])
    {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: leftImageName), style: UIBarButtonItemStyle.Plain, target: self, action: "leftAction:")
        
        var rightBtnArr: [UIBarButtonItem] = [UIBarButtonItem]()
        for i in 0..<rightImagesName.count {
            let imageName = rightImagesName[i]
            let btn = UIBarButtonItem(image: UIImage(named: imageName), style: UIBarButtonItemStyle.Plain, target: self, action: "rightAction:")
            btn.tag = i + 1
            rightBtnArr.append(btn)
        }
        navigationItem.rightBarButtonItems = rightBtnArr
    }
}
