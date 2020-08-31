//
//  PageViewController.swift
//  SwiftLoan
//
//  Created by Gabriel Mendonça on 29/08/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {

    private var pageControl = UIPageControl(frame: .zero)
    
    lazy var subViewController: [UIViewController] = {
       return[
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Page1ViewController") as! Page1ViewController,
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Page2ViewController") as! Page2ViewController,
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Page3ViewController") as! Page3ViewController
        ]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self
        setViewControllerFromIndex(index: 0)
        setupPageControl()
        
    }
    
    func setViewControllerFromIndex(index: Int) {
        self.setViewControllers([subViewController[0]], direction: .forward, animated: true, completion: nil)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewController.count
    }
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewController.index(of: viewController) ?? 0
        pageControl.currentPage = currentIndex
        if currentIndex <= 0 {
            return nil
        }
        return subViewController[currentIndex-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
         let currentIndex: Int = subViewController.index(of: viewController) ?? 0
         pageControl.currentPage = currentIndex
         if currentIndex >= subViewController.count-1 {
            return nil
         }
        return subViewController[currentIndex+1]
    }
    
    private func setupPageControl() {

           pageControl.numberOfPages = subViewController.count
           pageControl.translatesAutoresizingMaskIntoConstraints = false
           pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 1, green: 0.7843137255, blue: 0, alpha: 1)
           pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.5882352941, alpha: 1).withAlphaComponent(0.8)

           let leading = NSLayoutConstraint(item: pageControl, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
           let trailing = NSLayoutConstraint(item: pageControl, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
           let bottom = NSLayoutConstraint(item: pageControl, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)

           view.insertSubview(pageControl, at: 0)
           view.bringSubviewToFront(pageControl)
           view.addConstraints([leading, trailing, bottom])
    }
    


}
