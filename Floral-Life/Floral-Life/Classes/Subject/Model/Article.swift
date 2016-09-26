//
//  Article.swift
//  Floral&Life
//
//  Created by paomoliu on 16/9/23.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

class Article: BaseModel
{
    // MARK: - Property
    /// 标题
    var title: String?
    /// 描述
    var desc: String?
    /// 图片地址
    var smallIcon: String?
    /// 阅读量
    var read: Int = 0
    /// 点赞量
    var appoint: Int = 0
    /// 评价数
    var fnCommentNum: Int = 0
    /// 作者
    var author: Author?
    /// 类别
    var category: Category? {
        didSet {
            category?.name = "［" + category!.name! + "］"
        }
    }
    
    // MARK: - Class Methods
    /**
     加载文章数据
     
     - parameter pageIndex: 当前加载文章的页数
     - parameter finished:  加载完成的回调
     */
    class func loadArticle(pageIndex: Int, finished: (models: [Article]?, error: NSError?)->())
    {
        let params = ["action": "mainList_NewVersion", "currentPageIndex": pageIndex]
        let path = "servlet/SysArticleServlet"

        NetworkTool.shareNetworkTool().POST(path, parameters: params, progress: nil, success: { (_, response) -> Void in
            let articles = response!["result"] as! [[String: AnyObject]]
            let models = dict2Model(articles)
            finished(models: models, error: nil)
            }) { (_, error) -> Void in
                Tools.printLog(error)
                finished(models: nil, error: error)
        }
    }
    
    /**
     字典数组转模型数组
     */
    class func dict2Model(articles: [[String: AnyObject]]) -> [Article]
    {
        var models = [Article]()
        for dict in articles {
            models.append(Article(dict: dict))
        }
        
        return models
    }
    
    // MARK: - System Methods
    //setValuesForKeysWithDictionary内部会调用下面的方法
    override func setValue(value: AnyObject?, forKey key: String)
    {
        //判断当前是否在给author字典赋值
        if "author" == key {
            author = Author(dict: value as! [String: AnyObject])
            
            return
        }
        
        //判断当前是否在给category字典赋值
        if "category" == key {
            category = Category(dict: value as! [String: AnyObject])
            
            return
        }
        
        super.setValue(value, forKey: key)
    }
}
