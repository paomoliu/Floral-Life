//
//  CategoryView.swift
//  Floral-Life
//
//  Created by paomoliu on 16/9/25.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

let kCategoryCellID = "kCategoryCellID"

class CategoryView: UICollectionView
{
    var categorys: [Category]?
    
    // MARK: - Life Cycle
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout)
    {
        super.init(frame: frame, collectionViewLayout: layout)
        
        // 设置聚合视图数据源与注册表单元
        dataSource = self
        registerClass(CategoryViewCell.self, forCellWithReuseIdentifier: kCategoryCellID)
        
        loadData()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Load Data
    /**
     加载类型数据
     */
    private func loadData()
    {
        Category.loadCategory { (models, error) -> () in
            self.categorys = models
            self.reloadData()
        }
    }
}

extension CategoryView: UICollectionViewDataSource
{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return categorys?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kCategoryCellID, forIndexPath: indexPath) as! CategoryViewCell
        cell.category = categorys![indexPath.item]
        
        return cell
    }
}
