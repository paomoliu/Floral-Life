//
//  DetailWebViewCell.swift
//  Floral-Life
//
//  Created by paomoliu on 16/9/27.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

let kWebCellHeightKey = "kWebCellHeightKey"

class DetailWebViewCell: UITableViewCell
{
    // MARK: - Property
    var pageUrl: NSURL? {
        didSet {
            webView.loadRequest(NSURLRequest(URL: pageUrl!))
        }
    }
    var cellHeight: CGFloat = 0 {
        didSet {
            if cellHeight > 0 {
                isFinishLoadH5 = true
                NSNotificationCenter.defaultCenter().postNotificationName(kWebHeightChanged, object: self, userInfo: [kWebCellHeightKey: Float(cellHeight)])
            }
        }
    }
    private var isFinishLoadH5: Bool = false
    
    // MARK: - Life Cycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI()
    {
        contentView.addSubview(webView)
        
        let views = ["webView": webView]
        var cons = [NSLayoutConstraint]()
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[webView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[webView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        contentView.addConstraints(cons)
    }
    
    // MARK: - Lazy Loading
    private lazy var webView: UIWebView = {
        let webView = UIWebView()
        webView.scrollView.scrollEnabled = false
        webView.delegate = self
        
        return webView
    }()
}

extension DetailWebViewCell: UIWebViewDelegate
{
    func webViewDidFinishLoad(webView: UIWebView)
    {
        if !isFinishLoadH5 && webView.scrollView.contentSize.height > 0 {
            cellHeight = webView.scrollView.contentSize.height
            isFinishLoadH5 = true
        } //if
    } //func
} //end
