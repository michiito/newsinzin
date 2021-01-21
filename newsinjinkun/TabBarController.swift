//
//  TabBarController.swift
//  newsinjinkun
//
//  Created by 伊藤倫 on 2020/08/02.
//  Copyright © 2020 michi.ito. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController,UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

       self.delegate = self
        
    }
    // タブバーのアイコンがタップされた時に呼ばれるdelegateメソッドを処理する。
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
            return true
    }
}
