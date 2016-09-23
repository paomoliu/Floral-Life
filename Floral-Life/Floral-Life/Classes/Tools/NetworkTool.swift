//
//  NetworkTool.swift
//  Floral-Life
//
//  Created by paomoliu on 16/9/23.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit
import AFNetworking

class NetworkTool: AFHTTPSessionManager
{
    static let tool: NetworkTool = {
        let baseUrl = NSURL(string: "http://m.htxq.net/")
        let t = NetworkTool(baseURL: baseUrl)
        t.responseSerializer.acceptableContentTypes = NSSet(objects: "application/xml", "text/xml", "text/html") as! Set<String>
        
        return t
    }()
    
    /**
     获取单例
     */
    class func shareNetworkTool() -> NetworkTool
    {
        return tool
    }
}
