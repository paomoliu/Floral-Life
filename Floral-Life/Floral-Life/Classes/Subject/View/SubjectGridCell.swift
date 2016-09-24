//
//  SubjectGridCell.swift
//  Floral-Life
//
//  Created by paomoliu on 16/9/24.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit
import SDWebImage

class SubjectGridCell: UICollectionViewCell
{
    var subject: Article? {
        didSet {
            pictrueView.sd_setImageWithURL(NSURL(string: subject!.smallIcon!))
            titleLabel.text = subject!.title
            descLabel.text = subject!.desc
            readLabel.text = "\(subject!.read)"
            appointLabel.text = "\(subject!.appoint)"
        }
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        setupUI()
        backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI()
    {
        // 添加子控件
        contentView.addSubview(pictrueView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descLabel)
        contentView.addSubview(lineView)
        contentView.addSubview(readView)
        contentView.addSubview(readLabel)
        contentView.addSubview(appointView)
        contentView.addSubview(appointLabel)
        pictrueView.image = UIImage(named: "ad_view_18x15_")
        
        // 布局前准备
        let dict = ["pictrueView": pictrueView, "titleLabel": titleLabel, "descLabel": descLabel,
                    "lineView": lineView, "readView": readView, "readLabel": readLabel,
                    "appointView": appointView, "appointLabel": appointLabel]
        pictrueView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        readView.translatesAutoresizingMaskIntoConstraints = false
        readLabel.translatesAutoresizingMaskIntoConstraints = false
        appointView.translatesAutoresizingMaskIntoConstraints = false
        appointLabel.translatesAutoresizingMaskIntoConstraints = false
        
        /// 布局子控件
        var cons = [NSLayoutConstraint]()
        let height = frame.width * 3 / 4
        let appointheight: CGFloat = 15
        let appointWidth = appointheight * 19 / 17
        let metrics = ["height": height, "appointWidth": appointWidth, "appointheight": appointheight]
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[pictrueView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dict)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[titleLabel]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dict)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[descLabel]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dict)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-4-[lineView]-4-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dict)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-4-[readView]-6-[readLabel]-12-[appointView(appointWidth)]-6-[appointLabel]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: dict)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[pictrueView(height)]-8-[titleLabel]-6-[descLabel]-12-[lineView]-8-[readView]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: dict)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:[lineView]-8-[readLabel]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dict)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:[lineView]-8-[appointView(appointheight)]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: dict)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:[lineView]-8-[appointLabel]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dict)
        
        contentView.addConstraints(cons)
    }
    
    // MARK: - 懒加载
    /// 图片
    private lazy var pictrueView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    /// 标题
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(14)
        label.backgroundColor = UIColor.yellowColor()
        label.sizeToFit()
        
        return label
    }()
    
    /// 描述
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor.grayColor()
        label.backgroundColor = UIColor.yellowColor()
        
        return label
    }()
    
    /// 分割线
    private lazy var lineView: UIImageView = {
        let line = UIImageView(image: UIImage(named: "underLine_280x0_"))
        
        return line
    }()
    
    /// 阅读图片
    private lazy var readView: UIImageView = {
        let readView = UIImageView(image: UIImage(named: "ad_view_18x15_"))
        
        return readView
    }()
    
    /// 阅读量
    private lazy var readLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor.grayColor()
        
        return label
    }()
    
    /// 点赞图片
    private lazy var appointView: UIImageView = {
        let appointView = UIImageView(image: UIImage(named: "f_zan_19x17_"))
        
        return appointView
    }()
    
    /// 点赞数
    private lazy var appointLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor.grayColor()
        
        return label
    }()
}
