//
//  DetailViewController.swift
//  Floral-Life
//
//  Created by paomoliu on 16/9/27.
//  Copyright © 2016年 Sunshine Girl. All rights reserved.
//

import UIKit

let kHeadViewCellID = "kHeadViewCellID"
let kWebViewCellID = "kWebViewCellID"
let kWebHeightChanged = "kWebHeightChanged"
let kScreenHeight = UIScreen.mainScreen().bounds.height

class DetailViewController: UITableViewController
{
    var article: Article?
    var webCellHeight: CGFloat?
    var headCellHeight: CGFloat = 0
    
    // MARK: - Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()

        setNav()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(DetailHeadViewCell.self, forCellReuseIdentifier: kHeadViewCellID)
        tableView.registerClass(DetailWebViewCell.self, forCellReuseIdentifier: kWebViewCellID)
    }
    
    // MARK: - Action Methods
    func clickedBackBtn()
    {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func clickedShareBtn()
    {
        
    }
    
    // MARK: - Setup UI
    private func setNav()
    {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ad_left_40x40_"), style: UIBarButtonItemStyle.Plain, target: self, action: "clickedBackBtn")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ad_share_40x40_"), style: UIBarButtonItemStyle.Plain, target: self, action: "clickedShareBtn")
        
        navigationItem.titleView = UIButton.createTitleBtn(article!.title!)
    }
}

extension DetailViewController: WebCellHeightDelegate
{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 2
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(kHeadViewCellID) as! DetailHeadViewCell
            cell.article = article
            cell.selectionStyle = .None
            
            return cell
        }
        let cell = tableView.dequeueReusableCellWithIdentifier(kWebViewCellID) as! DetailWebViewCell
        cell.pageUrl = article?.pageURL
        cell.selectionStyle = .None
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(kHeadViewCellID) as! DetailHeadViewCell
            headCellHeight = cell.cellHeight(article!)
            
            return headCellHeight
        }
        
        return webCellHeight ?? kScreenHeight - headCellHeight - 64
    }
    
    func cellHeightChange(height: CGFloat)
    {
        webCellHeight = height
        tableView.reloadRowsAtIndexPaths([NSIndexPath(forRow: 1, inSection: 0)], withRowAnimation: UITableViewRowAnimation.None)
    }
}
