//
//  BlurView.swift
//  Floral-Life
//
//  Created by paomoliu on 16/9/26.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

class BlurView: UIVisualEffectView
{
    // MARK: - Init Methods
    override init(effect: UIVisualEffect?)
    {
        super.init(effect: effect)
        
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI()
    {
        // 添加子控件
        addSubview(categoryView)
        
        // 布局前准备
        var cons = [NSLayoutConstraint]()
        let views = ["categoryView": categoryView]
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        
        // 布局子控件
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[categoryView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[categoryView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        addConstraints(cons)
    }
    
    // MARK: - Lazy Loading
    /// 分类集合视图
    private lazy var categoryView: CategoryView = {
        let categoryView = CategoryView(frame: CGRectZero, collectionViewLayout: CategoryViewLayout())
        categoryView.backgroundColor = UIColor.clearColor()
        
        return categoryView
    }()
}

private class CategoryViewLayout: UICollectionViewFlowLayout
{
    private override func prepareLayout()
    {
        let space: CGFloat = 1
        
        // 设置布局
        minimumInteritemSpacing = space
        minimumLineSpacing = space
        scrollDirection = UICollectionViewScrollDirection.Vertical
        
        // 设置集合视图属性
        collectionView?.showsVerticalScrollIndicator = false
    }
}
