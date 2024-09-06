//
//  BaseViewController.swift
//  AGNavigationBar_Example
//
//  Created by arthurguan on 2024/7/22.
//  Copyright © 2024 arthurguan. All rights reserved.
//

import UIKit
import AGNavigationBar

class BaseViewController: UIViewController {
    
    var navBar: AGNavigationBar! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        AGNavigationBar.Config.barTintColor = .init(red: 111/256, green: 200/256, blue: 156/256, alpha: 1)
//        AGNavigationBar.Config.backgroundImage = UIImage(named: "bg")
        AGNavigationBar.Config.backImage = "navi_back"
        AGNavigationBar.Config.backActionHandler = { _ in
            print("点击返回")
            self.navPop()
        }
        confitNavBar()
    }
    
    func navPop() {
        navigationController?.popViewController(animated: true)
    }

    func confitNavBar() {
        let nav = AGNavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 59+44))
        view.addSubview(nav)
        navBar = nav
    }
}
