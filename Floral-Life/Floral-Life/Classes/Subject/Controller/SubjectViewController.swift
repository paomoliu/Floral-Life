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
    var categoryBtn: UIButton?
    
    // MARK: - Life Cycle
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
    
    // MARK: - Action Methods
    /**
     重写导航栏右边按钮的触发事件
     
     - parameter btn: 触发事件的按钮
     */
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
    
    func clickedCategoryBtn()
    {
        categoryBtn?.selected = !categoryBtn!.selected
        let angle = M_PI_2
        let translationY = CGRectGetHeight(blurView.frame) + 64
        
        // 整个动画过程先设置tranform，再清空transform，再设置，才能出现一上一下的效果
        // 若不这样设置，会使得在回去的时候无上动画效果
        if categoryBtn!.selected {
            setupBlurView()
            self.blurView.transform = CGAffineTransformMakeTranslation(0, -translationY)
        }
        
        // weak：相当于OC中__weak，特点对象释放之后会将变量设置为nil, 若用它self需要加！
        // unowned：相当于OC中unsafe_unretained，特点对象释放之后不会将变量设置为nil
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            if self.categoryBtn!.selected { // 旋转
                self.categoryBtn?.transform = CGAffineTransformRotate(self.categoryBtn!.transform, CGFloat(angle))
                self.blurView.transform = CGAffineTransformIdentity
            } else { // 回去
                self.categoryBtn?.transform = CGAffineTransformIdentity
                self.blurView.transform = CGAffineTransformMakeTranslation(0, -translationY)
            }
            }) { (_) -> Void in
                //回去时，需移除blurView
                if !self.categoryBtn!.selected {
                    self.blurView.removeFromSuperview()
                } //if
        } //闭包
    } //func
    
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
    
    // MARK: - Load Data
    func loadData()
    {
        Article.loadArticle(0) { (models, error) -> () in
            self.subjects = models
        }
    }
    
    // MARK: - SetupUI Methods
    private func setNav()
    {
        setNavigationBar("", rightImagesName: ["f_search_22x22_", "宫格_16x16_"])
        
        //自定义leftBarButtonItem
        let imageView = UIImageView(image: UIImage(named: "hp_type_16x16_"))
        imageView.bounds = CGRectMake(0, 0, 16, 16)
        categoryBtn = UIButton(type: UIButtonType.Custom)
        categoryBtn?.frame = CGRectMake(0, 0, 16, 16)
        categoryBtn?.addSubview(imageView)
        categoryBtn?.addTarget(self, action: "clickedCategoryBtn", forControlEvents: UIControlEvents.TouchUpInside)
        let leftBarItem = UIBarButtonItem(customView: categoryBtn!)
        navigationItem.leftBarButtonItem = leftBarItem
        
        // 标题
        let titleBtn = TitleButton()
        titleBtn.addTarget(self, action: "clickedTitleBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        navigationItem.titleView = titleBtn
    }
    
    private func setupUI()
    {
        // 添加集合视图
        view.addSubview(collectionView)
        
        // 布局前的准备
        let views = ["collectionView": collectionView]
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // 布局集合视图
        var cons = [NSLayoutConstraint]()
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[collectionView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:|-64-[collectionView]-44-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        view.addConstraints(cons)
    }
    
    private func setupBlurView()
    {
        // 添加集合视图
        view.addSubview(blurView)
        
        // 布局前的准备
        var cons = [NSLayoutConstraint]()
        let views = ["blurView": blurView]
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        // 布局集合视图
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[blurView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons.append(NSLayoutConstraint(item: blurView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: collectionView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0))
        cons.append(NSLayoutConstraint(item: blurView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: collectionView, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0))
        view.addConstraints(cons)
    }
    
    // MARK: - Lazy Loading
    /// 专题数据展示集合视图
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: SubjectViewLayout())
        collectionView.backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1.0)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    /// 高斯蒙板
    private lazy var blurView: BlurView = BlurView(effect: UIBlurEffect(style: .Light))
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
