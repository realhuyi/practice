//
//  ViewController.swift
//  PageNavigation
//
//  Created by apple2 on 7/14/14.
//  Copyright (c) 2014 HUYI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    @IBOutlet var tableView: UITableView
    @IBOutlet var tableView: UITableView
    enum DirectionForward: Int8 {
        case ForwardBefore = 1
        case ForwardAfter = 2
    }
    
    var pageIndex:Int = 0
    var direction:DirectionForward = DirectionForward.ForwardBefore
    
    strong var pageViewControllerX:UIPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.pageViewControllerX = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.PageCurl,
            navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal,
            options: nil)
        
        self.pageViewControllerX!.delegate = self
        self.pageViewControllerX!.dataSource = self
        
        var mainStroyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        var page1ViewController:UIViewController = mainStroyBoard.instantiateViewControllerWithIdentifier("page1") as UIViewController
        
        
        var viewControllers:NSArray = [page1ViewController]
        
        self.pageViewControllerX?.setViewControllers(viewControllers, direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        self.addChildViewController(self.pageViewControllerX)
        self.view.addSubview(self.pageViewControllerX?.view)
        
        pageIndex = 0
    }
    
    
    func pageViewController(pageViewController: UIPageViewController!, viewControllerBeforeViewController viewController: UIViewController!) -> UIViewController! {
        
        pageIndex -= 1
        
        if pageIndex < 0 {
            pageIndex = 0
            return nil
        }
        
        
        var mainStroyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        var pageId:NSString = NSString(format: "page%i", pageIndex + 1)
        
        direction = DirectionForward.ForwardBefore
        
        var pvController:UIViewController = mainStroyBoard.instantiateViewControllerWithIdentifier(pageId) as UIViewController
        return pvController
        
    }
    
    func pageViewController(pageViewController: UIPageViewController!, viewControllerAfterViewController viewController: UIViewController!) -> UIViewController! {
        
        pageIndex += 1
        
        if pageIndex > 2 {
            pageIndex = 2
            return nil
        }
        var mainStroyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var pageId:NSString = NSString(format: "page%i", pageIndex + 1)
        
        direction = DirectionForward.ForwardAfter
        
        var pvController:UIViewController = mainStroyBoard.instantiateViewControllerWithIdentifier(pageId) as UIViewController
        return pvController
        
    }
    
    
   /* func pageViewController(pageViewController: UIPageViewController!, spineLocationForInterfaceOrientation orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        
        self.pageViewControllerX!.doubleSided = false
        
        return UIPageViewControllerSpineLocation.Min
  
    }*/

    func pageViewController(pageViewController: UIPageViewController!, didFinishAnimating finished: Bool, previousViewControllers: [AnyObject]!, transitionCompleted completed: Bool) {
        if !completed {
            if direction == DirectionForward.ForwardAfter{
                pageIndex -= 1
            }
            if direction == DirectionForward.ForwardBefore{
                pageIndex += 1
            }
        }
    }
    

    
    func pageViewController(pageViewController: UIPageViewController!,  spineLocationForInterfaceOrientation orientation:UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        
        var mainStroyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var page1ViewController:UIViewController = mainStroyBoard.instantiateViewControllerWithIdentifier("page1") as UIViewController
        var page2ViewController:UIViewController = mainStroyBoard.instantiateViewControllerWithIdentifier("page2") as UIViewController

        
        if orientation == UIInterfaceOrientation.LandscapeLeft || orientation == UIInterfaceOrientation.LandscapeRight {
            var viewControllers:NSArray = [page1ViewController, page2ViewController]
            self.pageViewControllerX?.setViewControllers(viewControllers,
                direction: UIPageViewControllerNavigationDirection.Forward,
                animated: true,
                completion: nil)
            
            self.pageViewControllerX!.doubleSided = false
            return UIPageViewControllerSpineLocation.Mid
        }
        
        var viewControllers:NSArray = [page1ViewController]
        
        self.pageViewControllerX?.setViewControllers(viewControllers, direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        self.pageViewControllerX!.doubleSided = false
        
        return UIPageViewControllerSpineLocation.Min
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

