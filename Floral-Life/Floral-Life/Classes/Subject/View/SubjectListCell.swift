//
//  SubjectListCell.swift
//  Floral-Life
//
//  Created by paomoliu on 16/9/24.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit
import SDWebImage

class SubjectListCell: SubjectBaseCell
{
    override var subject: Article? {
        didSet {
            avatar.sd_setImageWithURL(NSURL(string: subject!.author!.headImg!))
            newAuthView.image = UIImage(named: subject?.author?.newAuth == "1" ? "copanyAuth_14x14_" : "personAuth_14x14_")
            nameLabel.text = subject?.author!.userName
            identityLabel.text = subject?.author?.identity
            categoryLabel.text = subject?.category?.name
            commentLabel.text = "\(subject!.fnCommentNum)"
            descLabel.attributedText = UILabel.setLabelLineSpace(4, text: subject!.desc!)
        }
    }
    
    override func setupUI()
    {
        super.setupUI()
        descLabel.numberOfLines = 0
        
        // 添加子控件
        contentView.addSubview(avatar)
        contentView.addSubview(newAuthView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(identityLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(commentView)
        contentView.addSubview(commentLabel)
        
        // 布局前准备
        let views = ["pictrueView": pictrueView, "titleLabel": titleLabel, "descLabel": descLabel,
                    "lineView": lineView, "readView": readView, "readLabel": readLabel,
                    "appointView": appointView, "appointLabel": appointLabel, "categoryLabel": categoryLabel,
                    "avatar": avatar, "newAuthView": newAuthView,   "nameLabel": nameLabel,
                    "identityLabel": identityLabel, "commentView": commentView, "commentLabel": commentLabel]
        var cons = [NSLayoutConstraint]()
        let height = frame.width * 0.5
        let avatarWidth: CGFloat = 50
        let newAuthWidth: CGFloat = 12
        let appointheight: CGFloat = 15
        let appointWidth = appointheight * 19 / 17
        let metrics = ["height": height, "avatarWidth": avatarWidth, "appointWidth": appointWidth,
                        "newAuthWidth": newAuthWidth, "appointheight": appointheight]
        avatar.translatesAutoresizingMaskIntoConstraints = false
        newAuthView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        identityLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        commentView.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 布局子控件
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[pictrueView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:[avatar(avatarWidth)]-12-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:[avatar(avatarWidth)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        cons.append(NSLayoutConstraint(item: avatar, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: pictrueView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -15))
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:[newAuthView(newAuthWidth)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:[newAuthView(newAuthWidth)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        cons.append(NSLayoutConstraint(item: newAuthView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: avatar, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 1))
        cons.append(NSLayoutConstraint(item: newAuthView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: avatar, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 1))
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-8-[nameLabel]-12-[avatar]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-8-[identityLabel]-12-[avatar]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[categoryLabel]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-8-[titleLabel]-40-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-8-[descLabel]-40-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[lineView]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:[readView]-6-[readLabel]-12-[appointView(appointWidth)]-6-[appointLabel]-12-[commentView]-6-[commentLabel]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[pictrueView(height)]-8-[nameLabel]-4-[identityLabel][categoryLabel]-4-[titleLabel]-4-[descLabel]-8-[lineView(1)]-8-[readView]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:[lineView]-8-[readLabel]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:[lineView]-8-[appointView(appointheight)]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:[lineView]-8-[appointLabel]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:[lineView]-8-[commentView]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:[lineView]-8-[commentLabel]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        
        contentView.addConstraints(cons)
    }
    
    // MARK: - 懒加载
    /// 头像
    private lazy var avatar: UIImageView = {
        let avatar = UIImageView()
        avatar.clipsToBounds = true
        avatar.layer.cornerRadius = 25
        avatar.layer.borderWidth = 1
        avatar.layer.borderColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1.0).CGColor
        
        return avatar
    }()
    
    /// 等级
    private lazy var newAuthView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        
        return imageView
    }()
    
    /// 作者名
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(14)
        label.textAlignment = NSTextAlignment.Right
        label.backgroundColor = UIColor.yellowColor()
        
        return label 
    }()
    
    /// 身份
    private lazy var identityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(10)
        label.textAlignment = NSTextAlignment.Right
        label.textColor = UIColor.grayColor()
        label.backgroundColor = UIColor.yellowColor()
        
        return label
    }()
    
    /// 类别
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor(red: 204/255, green: 186/255, blue: 148/255, alpha: 1.0)
        label.backgroundColor = UIColor.yellowColor()
        
        return label
    }()
    
    /// 评价图片
    private lazy var commentView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "p_comment_15x15_"))
        
        return imageView
    }()
    
    /// 评价数
    lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(10)
        label.textColor = UIColor.grayColor()
        
        return label
    }()
}
