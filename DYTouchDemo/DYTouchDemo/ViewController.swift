//
//  ViewController.swift
//  DYTouchDemo
//
//  Created by DovYoung on 2017/2/4.
//  Copyright © 2017年 DovYoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView.init(frame: CGRect.init(), style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(tableView)
        
        self.view.backgroundColor = UIColor.red
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.addSubview(tableView)
        
    }

    override func viewDidLayoutSubviews() {
        
        tableView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
    }
    
    // MARK: - TableView DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 5
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "cellIdentifier"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellIdentifier)
            
        }
        
        cell?.textLabel?.text = "hello swift"
        
        cell?.textLabel?.textColor = UIColor.black
        
        return cell!
        
    }
    
    // MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80.00
        
    }

    
    
}

