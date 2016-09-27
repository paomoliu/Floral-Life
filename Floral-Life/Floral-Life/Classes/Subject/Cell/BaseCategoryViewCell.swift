//
//  BaseCategoryViewCell.swift
//  Floral-Life
//
//  Created by paomoliu on 16/9/26.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit
import SDWebImage

class BaseCategoryViewCell: UICollectionViewCell
{
    var category: Category? {
        didSet {
            pictureView.sd_setImageWithURL(category?.imgUrl)
            nameLabel.text = "\(category!.enName!)｜\(category!.name!)"
        }
    }
    
    // MARK: - Life Cycle
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    func setupUI()
    {
        // 添加子控件
        contentView.addSubview(pictureView)
        contentView.addSubview(coverView)
        contentView.addSubview(nameLabel)
        
        // 布局前准备
        var cons = [NSLayoutConstraint]()
        let views = ["pictureView": pictureView, "coverView": coverView, "nameLabel": nameLabel]
        pictureView.translatesAutoresizingMaskIntoConstraints = false
        coverView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 布局子控件
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|[pictureView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:|[pictureView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|[coverView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:|[coverView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        contentView.addConstraints(cons)
    }
    
    // MARK: - Lazy Loading
    /// 类别图片
    private lazy var pictureView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    /// 蒙板
    private lazy var coverView: UIView = {
        let coverView = UIView()
        coverView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        
        return coverView
    }()
    
    /// 类别中英文名称
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.whiteColor()
        label.font = UIFont.systemFontOfSize(12)
        
        return label
    }()
}

