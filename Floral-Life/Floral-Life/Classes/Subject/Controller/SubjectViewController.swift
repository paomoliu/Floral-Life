//
//  SubjectViewController.swift
//  Floral&Life
//
//  Created by paomoliu on 16/9/22.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.mainScreen().bounds.width
/// 记录是否以显示模式展示数据
var isGridMode: Bool = false

class SubjectViewController: BaseViewController
{
    var subjects: [Article]? {
        didSet {
            //当设置完数据，刷新集合视图
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        setNav()
        setupUI()
        
        //注册两种cell
        collectionView.registerClass(SubjectGridCell.self, forCellWithReuseIdentifier: SubjectCollectionCellID.GridCellID.rawValue)
        collectionView.registerClass(SubjectListCell.self, forCellWithReuseIdentifier: SubjectCollectionCellID.ListCellID.rawValue)
        
        loadData()
    }
    
    override func leftAction(btn: UIBarButtonItem)
    {
        switchToCategory()
    }
    
    override func rightAction(btn: UIBarButtonItem)
    {
        if btn.tag == 1 {
            search()
        } else {
            switchShowMode(btn)
        }
    }
    
    func clickedTitleBtn(btn: TitleButton)
    {
        Tools.printLog("")
    }
    
    func switchToCategory()
    {
        Tools.printLog("")
    }
    
    /**
     切换数据展示模式
     */
    func switchShowMode(btn: UIBarButtonItem)
    {
        btn.image = UIImage(named: !isGridMode ? "列表_16x16_" : "宫格_16x16_")
        isGridMode = !isGridMode
        collectionView.reloadData()
    }
    
    /**
     搜索
     */
    func search()
    {
        Tools.printLog("")
    }
    
    func loadData()
    {
        Article.loadArticle(0) { (models, error) -> () in
            self.subjects = models
        }
    }
    
    // MARK: - Private Methods
    private func setNav()
    {
        setNavigationBar("hp_type_16x16_", rightImagesName: ["f_search_22x22_", "宫格_16x16_"])
        
        
        let titleBtn = TitleButton()
        titleBtn.addTarget(self, action: "clickedTitleBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        navigationItem.titleView = titleBtn
    }
    
    private func setupUI()
    {
        // 添加集合视图
        view.addSubview(collectionView)
        
        // 布局前的准备
        let dict = ["collectionView": collectionView]
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // 布局集合视图
        var cons = [NSLayoutConstraint]()
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[collectionView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dict)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:|-64-[collectionView]-44-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dict)
        view.addConstraints(cons)
    }
    
    // MARK: - 懒加载
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: SubjectViewLayout())
        collectionView.backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1.0)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
}

extension SubjectViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return subjects?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(SubjectCollectionCellID.cellID(isGridMode)
            , forIndexPath: indexPath) as! SubjectBaseCell
        cell.subject = subjects![indexPath.item]
        
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
//    {
//        return CGSizeMake(320, 250)
//    }
}

private class SubjectViewLayout: UICollectionViewFlowLayout
{
    private override func prepareLayout()
    {
        var space: CGFloat = 12
        let margin: CGFloat = 10
        
        var width = kScreenWidth - margin * 2
        var height = width * 0.5 + 150
        
        if isGridMode {
            space = 5
            width = (kScreenWidth - margin * 2 - space) * 0.5
            height = width * 0.75 + 80
        }
        
        // 设置布局
        itemSize = CGSizeMake(width, height)
        minimumInteritemSpacing = space
        minimumLineSpacing = space
        scrollDirection = UICollectionViewScrollDirection.Vertical
        
        // 设置集合视图属性
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.contentInset = UIEdgeInsetsMake(margin, margin, 0, margin)
    }
}
