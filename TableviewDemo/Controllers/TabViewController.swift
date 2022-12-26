//
//  TabViewController.swift
//  TableviewDemo
//
//  Created by 葉育彣 on 2022/12/26.
//

import UIKit

final class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        setUpTabs()
    }
    
    private func setUpTabs(){
        let homeVC = HomeViewController()
        let coverVC = CoverFlowViewController()
        let menuVC = MenuViewController()
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "person"), selectedImage: nil)
        coverVC.tabBarItem = UITabBarItem(title: "Cover", image: UIImage(systemName: "globe"), selectedImage: nil)
        menuVC.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(systemName: "tv"), selectedImage: nil)
        
        setViewControllers(
            [homeVC, coverVC, menuVC],
            animated: true)
        
    }
}
