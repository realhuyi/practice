//
//  ViewController.swift
//  PageControlNavigation
//
//  Created by apple2 on 7/10/14.
//  Copyright (c) 2014 HUYI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
                            
    @IBOutlet var tableView: UITableView
    @IBOutlet strong var scrollView: UIScrollView
    
    @IBOutlet strong var pageControl: UIPageControl
    
    @IBAction func changPage(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: {
            var whichPage:int = self.pageControl.currentPage
            self.scrollView.contentOffset = CGPointMake(320.0 * whichPage, 0.0)
            })
        
    }
    
    //properties
    var page1:UIView
    var page2:UIView
    var page3:UIView
    //properties
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height)
        
        self.scrollView.frame = self.view.frame
        
        var mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        var page1ViewController:UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("page1")
        self.page1 = page1ViewController.view
        self.page1.frame = CGRectMake(0.0, 0.0, 320.0, 420.0)
        
        var page1ViewController:UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("page2")
        self.page2 = page1ViewController.view
        self.page2.frame = CGRectMake(320.0, 0.0, 320.0, 420.0)
        
        var page1ViewController:UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("page3")
        self.page3 = page1ViewController.view
        self.page3.frame = CGRectMake(640.0, 0.0, 320.0, 420.0)
        
        self.scrollView.delegate = self
        self.scrollView.addSubview(page1)
        self.scrollView.addSubview(page2)
        self.scrollView.addSubview(page3)
        
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        var offset:CGPoint = scrollView.contentOffset
        self.pageControl.currentPage = offset.x / 320.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

