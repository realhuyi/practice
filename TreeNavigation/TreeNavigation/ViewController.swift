//
//  ViewController.swift
//  TreeNavigation
//
//  Created by apple2 on 7/17/14.
//  Copyright (c) 2014 HUYI. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
                            

    strong var dictData:NSDictionary = NSDictionary()
    strong var listData:NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.tableView.delegate = self
        //self.tableView.dataSource = self
        
        var bundle:NSBundle = NSBundle.mainBundle()
        var path:String = bundle.pathForResource("provinces_cities", ofType: "plist")
        
        self.dictData = NSDictionary(contentsOfFile: path)
        
        self.listData = dictData.allKeys
        
        self.title = "城市信息"
        
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }

    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        var CellIdentifier:NSString = "Cell"
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath) as UITableViewCell
        var row:NSInteger = indexPath.row
        cell.textLabel.text = self.listData.objectAtIndex(row) as NSString
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "ShowSelectedProvince" {
            var citiesViewController:CitiesViewController = segue.destinationViewController as CitiesViewController
            var selectedIndex:NSInteger = self.tableView.indexPathForSelectedRow().row
            var selectName:NSString = self.listData.objectAtIndex(selectedIndex) as NSString
            //citiesViewController.listData = self.dictData.objectForKey(selectName)
            citiesViewController.title = selectName
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

