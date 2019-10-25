//
//  MainTabController.swift
//  Easy Exams - Deca Prep
//
//  Created by Srihari Vishnu on 2018-09-29.
//  Copyright © 2018 Srihari Vishnu. All rights reserved.
//

import Foundation
import UIKit

class MainTabController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set the selected tab and style of the tabController
        self.tabBar.isTranslucent = false
        self.tabBar.unselectedItemTintColor = UIColor.lightGray
        self.selectedViewController = self.viewControllers?[1]
    
    }
}
