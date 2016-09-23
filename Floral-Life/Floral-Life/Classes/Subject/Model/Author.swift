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
    /// 作者id
    var id: String?
    /// 作者名称
    var userName: String?
    /// 身份
    var identity: String?
    /// 作者头像
    var headImg: String?
    /// 等级
    var newAuth: String?
    
    override init(dict: [String : AnyObject])
    {
        super.init(dict: dict)
    }
}
