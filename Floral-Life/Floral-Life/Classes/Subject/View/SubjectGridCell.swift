//
//  SubjectGridCell.swift
//  Floral-Life
//
//  Created by paomoliu on 16/9/24.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit
import SDWebImage

class SubjectGridCell: SubjectBaseCell
{
    // MARK: - Override Method
    override func setupUI()
    {
        super.setupUI()
        
        // 布局前准备
        let views = ["pictrueView": pictrueView, "titleLabel": titleLabel, "descLabel": descLabel,
                    "lineView": lineView, "readView": readView, "readLabel": readLabel,
                    "appointView": appointView, "appointLabel": appointLabel]
        var cons = [NSLayoutConstraint]()
        let height = frame.width * 0.75
        let appointheight: CGFloat = 15
        let appointWidth = appointheight * 19 / 17
        let metrics = ["height": height, "appointWidth": appointWidth, "appointheight": appointheight]
        
        /// 布局子控件
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[pictrueView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-8-[titleLabel]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-8-[descLabel]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-4-[lineView]-4-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-4-[readView]-6-[readLabel]-12-[appointView(appointWidth)]-6-[appointLabel]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[pictrueView(height)]-8-[titleLabel]-6-[descLabel]-12-[lineView]-8-[readView]-6-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:[lineView]-8-[readLabel]-6-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:[lineView]-8-[appointView(appointheight)]-6-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:[lineView]-8-[appointLabel]-6-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        
        contentView.addConstraints(cons)
    }
}
