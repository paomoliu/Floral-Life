//
//  SubjectBaseCell.swift
//  Floral-Life
//
//  Created by paomoliu on 16/9/25.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

class SubjectBaseCell: UICollectionViewCell
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
    
    func itemHeight(subject: Article) -> CGFloat
    {
        self.subject = subject
        self.layoutIfNeeded()
        
        return CGRectGetMaxY(readLabel.frame) + 10.0
    }
    
    func setupUI()
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
        
        // 关闭view的AutoresizingMask
        pictrueView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        readView.translatesAutoresizingMaskIntoConstraints = false
        readLabel.translatesAutoresizingMaskIntoConstraints = false
        appointView.translatesAutoresizingMaskIntoConstraints = false
        appointLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - 懒加载
    /// 图片
    lazy var pictrueView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    /// 标题
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(12)
        label.backgroundColor = UIColor.yellowColor()
        
        return label
    }()
    
    /// 描述
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(10)
        label.textColor = UIColor.grayColor()
        label.backgroundColor = UIColor.yellowColor()
        
        return label
    }()
    
    /// 分割线
    lazy var lineView: UIImageView = {
        let line = UIImageView(image: UIImage(named: "underLine_280x0_"))
        
        return line
    }()
    
    /// 阅读图片
    lazy var readView: UIImageView = {
        let readView = UIImageView(image: UIImage(named: "ad_view_18x15_"))
        
        return readView
    }()
    
    /// 阅读量
    lazy var readLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(10)
        label.textColor = UIColor.grayColor()
        
        return label
    }()
    
    /// 点赞图片
    lazy var appointView: UIImageView = {
        let appointView = UIImageView(image: UIImage(named: "f_zan_19x17_"))
        
        return appointView
    }()
    
    /// 点赞数
    lazy var appointLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(10)
        label.textColor = UIColor.grayColor()
        
        return label
    }()
}
