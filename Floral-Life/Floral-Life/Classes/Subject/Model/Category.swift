//
//  Category.swift
//  Floral&Life
//
//  Created by paomoliu on 16/9/23.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

class Category: BaseModel
{
    // MARK: - Property
    /// 分类id
    var id: String?
    /// 英文名
    var enName: String?
    /// 中文名
    var name: String?
    /// 图片地址
    var img: String?
    
    // MARK: - Class Methods
    /**
     加载分类数据
     
     - parameter finished: 数据加载后的回调
     */
    class func loadCategory(finished: (models: [Category]?, error: NSError?)->())
    {
        let params = ["action": "getListNew"]
        let path = "servlet/SysCategoryServlet"
        
        NetworkTool.shareNetworkTool().POST(path, parameters: params, progress: nil, success: { (_, reponse) -> Void in
            let categorys = reponse!["result"] as! [[String: AnyObject]]
            let models = dict2Model(categorys)
            finished(models: models, error: nil)
            }) { (_, error) -> Void in
                print(error)
                finished(models: nil, error: error)
        }
    }
    
    /**
     字典数组转模型数组
     */
    class func dict2Model(categorys: [[String: AnyObject]]) -> [Category]
    {
        var models = [Category]()
        for dict in categorys {
            models.append(Category(dict: dict))
        }
        
        return models
    }
    
    // MARK: - Life Cycle
    override init(dict: [String : AnyObject])
    {
        super.init(dict: dict)
    }
}
