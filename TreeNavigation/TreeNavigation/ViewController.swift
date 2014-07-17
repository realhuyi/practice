//
//  ViewController.swift
//  TreeNavigation
//
//  Created by apple2 on 7/17/14.
//  Copyright (c) 2014 HUYI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
                            

    @IBOutlet var tableView: UITableView
    
    strong var dictData:NSDictionary = NSDictionary()
    strong var listData:NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        var bundle:NSBundle = NSBundle.mainBundle()
        var path:String = bundle.pathForResource("provinces_cities", ofType: "plist")
        
        self.dictData = NSDictionary(contentsOfFile: path)
        
        self.listData = dictData.allKeys
        
        self.title = "城市信息"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

