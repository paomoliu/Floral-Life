//
//  SubjectViewController.swift
//  Floral&Life
//
//  Created by paomoliu on 16/9/22.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

class SubjectViewController: BaseViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()

        setNav()
    }
    
    func clickedTitleBtn(btn: TitleButton)
    {
        Tools.printLog("")
    }
    
    private func setNav()
    {
        setNavigationBar("hp_type_16x16_", rightImagesName: ["f_search_22x22_", "列表_16x16_"])
        
        let titleBtn = TitleButton()
        titleBtn.addTarget(self, action: "clickedTitleBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        navigationItem.titleView = titleBtn
    }
}
