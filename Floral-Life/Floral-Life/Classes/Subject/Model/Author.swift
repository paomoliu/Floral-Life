//
//  Author.swift
//  Floral-Life
//
//  Created by paomoliu on 16/9/23.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

class Author: BaseModel
{
    // MARK: - Property
    /// 作者id
    var id: String?
    /// 作者名称
    var userName: String?
    /// 身份
    var identity: String?
    /// 作者头像
    var headImg: String? {
        didSet {
            headImgUrl = NSURL(string: headImg!)
        }
    }
    /// 等级
    var newAuth: String? {
        didSet {
            authImgName = newAuth == "1" ? "copanyAuth_14x14_" : "personAuth_14x14_"
        }
    }
    /// 头像url
    var headImgUrl: NSURL?
    /// 等级图片名称
    var authImgName: String?
    
    // MARK: - Life Cycle
    override init(dict: [String : AnyObject])
    {
        super.init(dict: dict)
    }
}
