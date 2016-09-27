//
//  DetailHeadViewCell.swift
//  Floral-Life
//
//  Created by paomoliu on 16/9/27.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit
import SDWebImage

class DetailHeadViewCell: UITableViewCell
{
    // MARK: - Property
    var article: Article? {
        didSet {
            headImage.sd_setImageWithURL(article!.smallIconUrl)
            titleLabel.text = article?.title
            categoryLabel.text = "#\(article!.category!.name!)#"
        }
    }
    
    // MARK: - Life Cycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellHeight(article: Article) -> CGFloat
    {
        self.article = article
        layoutIfNeeded()
        
        return CGRectGetMaxY(lineView.frame) + 6
    }
    
    // MARK: - Setup UI
    private func setupUI()
    {
        // 添加子控件
        contentView.addSubview(headImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(lineView)
        
        // 布局前准备
        var cons = [NSLayoutConstraint]()
        let views = ["headImage": headImage, "titleLabel": titleLabel,
                    "categoryLabel": categoryLabel, "lineView": lineView]
        let height = kScreenWidth * 0.5
        let metrics = ["height": height]
        headImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        // 布局子控件
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[headImage]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons.append(NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        cons.append(NSLayoutConstraint(item: categoryLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: titleLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        cons.append(NSLayoutConstraint(item: lineView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: titleLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:[lineView(40)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[headImage(height)]-15-[titleLabel]-10-[categoryLabel]-10-[lineView(1)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        contentView.addConstraints(cons)
    }
    
    // MARK: - Lazy Loading
    /// 头部图片
    private lazy var headImage: UIImageView = UIImageView()
    
    /// 标题
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(16)
        
        return label
    }()
    
    /// 分类
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(10)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        
        return label
    }()
    
    /// 分割线
    private lazy var lineView: UIImageView = UIImageView(image: UIImage(named: "topLineBlack_97x0_"))
}
