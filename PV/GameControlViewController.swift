//
//  GameControlViewController.swift
//  PV
//
//  Created by Red Phoenix on 24/11/20.
//

import UIKit

class GameControlViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
    lazy var orderedVC : [UIViewController] = {
        
        
        return [
            self.newViewC(viewController: "game1"),
            self.newViewC(viewController: "game2")
        ]
    }()
    
    
    var pageControls = UIPageControl()
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        
        
        if let firstVC = orderedVC.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        configPageControl()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    func configPageControl() {
        
    }
    
    //this is for page control
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControls.currentPage = orderedVC.index(of: pageContentViewController)!
        
    }
    
    func newViewC(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedVC.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return orderedVC.last        }
        
        guard orderedVC.count > previousIndex else {
            return nil
        }
        
        return orderedVC[previousIndex]
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedVC.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard orderedVC.count > nextIndex else {
            return orderedVC.first
        }
        
//        guard orderedViewControllers.count > nextIndex else {
//            return nil
//        }
        
        return orderedVC[nextIndex]
        
    }

   

}
