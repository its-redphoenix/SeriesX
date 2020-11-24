//
//  PageControlViewController.swift
//  PV
//
//  Created by Red Phoenix on 23/11/20.
//

import UIKit

class PageControlViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    lazy var orderedViewControllers : [UIViewController] = {
        return [self.newVC(viewController: "screen1"),
            self.newVC(viewController: "screen2"),
            self.newVC(viewController: "screen3"),
            self.newVC(viewController: "screen4")
            
        ]
    }()
    
    var pageControl = UIPageControl()
  
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.dataSource = self
        
        
        if let firstViewController = orderedViewControllers.first {
            
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        configurePageControl()
        
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x:0, y: UIScreen.main.bounds.maxY - 200, width: UIScreen.main.bounds.width, height: 150))
        pageControl.numberOfPages = orderedViewControllers.count
        pageControl.currentPage = 0
        pageControl.tintColor = .black
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPageIndicatorTintColor = .black
        
        //this adds the subview to the main view
        self.view.addSubview(pageControl)
    }
    
    
    func newVC(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
        
    }
    
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return orderedViewControllers.last        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
        
        
        
    }
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard orderedViewControllers.count > nextIndex else {
            return orderedViewControllers.first
        }
        
//        guard orderedViewControllers.count > nextIndex else {
//            return nil
//        }
        
        return orderedViewControllers[nextIndex]
        
        
        
        
    }
    
    
    

   

}
