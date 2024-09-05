//
//  SecondViewController.swift
//  AGNavigationBar_Example
//
//  Created by arthurguan on 2024/7/22.
//  Copyright © 2024 arthurguan. All rights reserved.
//

import UIKit
import AGNavigationBar

class SecondViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .lightGray
    }
    
    override func confitNavBar() {
        super.confitNavBar()
        
        navBar.title = "设置"
        navBar.barTintColor = .blue
        navBar.actionTintColor = .red
        navBar.addAction(AGNavigationBarAction(title: "保存", position: .right, handler: { action in
        }))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
