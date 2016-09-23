//
//  Tools.swift
//  Floral&Life
//
//  Created by paomoliu on 16/9/22.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

class Tools: NSObject
{
    /**
     输出日志
     
     - parameter message:  日志消息
     - parameter file:     文件名
     - parameter method:   方法名
     - parameter line:     代码行数
     */
    class func printLog<T>(message: T,
                        file: String = __FILE__,
                      method: String = __FUNCTION__,
                        line: Int = __LINE__)
    {
        #if DEBUG
            print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
        #endif
    }
}
