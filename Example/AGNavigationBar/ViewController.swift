//
//  ViewController.swift
//  AGNavigationBar
//
//  Created by arthurguan on 07/18/2024.
//  Copyright (c) 2024 arthurguan. All rights reserved.
//

import UIKit
import AGNavigationBar

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        view.backgroundColor = .green
        
        let _ = UINavigationBar()
        let _ = UIAlertController()
        
    }
    
    override func confitNavBar() {
        super.confitNavBar()
        
        navBar.title = "首页"
        let action = AGNavigationBarAction(title: "下一页", position: .right, handler: { action in
            self.navigationController?.pushViewController(ThirdViewController(), animated: true)
        })
        navBar.addAction(action)
        navBar.actionTintColor = .black
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

