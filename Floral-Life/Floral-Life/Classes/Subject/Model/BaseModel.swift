//
//  BaseModel.swift
//  Floral-Life
//
//  Created by paomoliu on 16/9/23.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

class BaseModel: NSObject
{
    /**
     字典转模型
     */
    init(dict: [String: AnyObject])
    {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String)
    {
    }
}
