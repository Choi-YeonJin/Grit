//
//  Hide_TabBarViewController.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/22.
//

import UIKit

class Hide_TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Hide_Tabbar")
    }
    
    // Hide Topbar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
