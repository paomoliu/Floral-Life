//
//  CategoryView.swift
//  Floral-Life
//
//  Created by paomoliu on 16/9/25.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

let kNormalCellID = "kNormalCellID"
let kTop10CellID = "kTop10CellID"

class CategoryView: UICollectionView
{
    var categorys: [Category]?
    
    // MARK: - Life Cycle
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout)
    {
        super.init(frame: frame, collectionViewLayout: layout)
        
        // 设置聚合视图数据源与注册表单元
        dataSource = self
        delegate = self
        registerClass(NormalCategoryViewCell.self, forCellWithReuseIdentifier: kNormalCellID)
        registerClass(Top10CategoryViewCell.self, forCellWithReuseIdentifier: kTop10CellID)
        
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

extension CategoryView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return categorys?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        var cell: BaseCategoryViewCell?
        if indexPath.item == 0 {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier(kTop10CellID, forIndexPath: indexPath) as? BaseCategoryViewCell
        } else {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier(kNormalCellID, forIndexPath: indexPath) as? BaseCategoryViewCell
        }
        cell!.category = categorys![indexPath.item]
        
        return cell!
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        if indexPath.item == 0 {
            return CGSizeMake(kScreenWidth, kScreenWidth * 0.5 * 0.75)
        }
        
        return CGSizeMake((kScreenWidth - 1) * 0.5, kScreenWidth * 0.5 * 0.75)
    }
}
