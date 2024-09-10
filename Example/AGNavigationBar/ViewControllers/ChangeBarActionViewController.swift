//
//  ChangeBarActionViewController.swift
//  AGNavigationBar_Example
//
//  Created by arthurguan on 2024/9/5.
//  Copyright © 2024 arthurguan. All rights reserved.
//

import UIKit
import AGNavigationBar

class ChangeBarActionViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func confitNavBar() {
        super.confitNavBar()
        
        navBar.title = "导航按钮"
        navBar.addAction(AGNavigationBarAction(title: "保存", position: .right, handler: { action in
            action.title = "😁"
        }))
        navBar.addAction(AGNavigationBarAction(title: "朋友圈", position: .right, handler: { action in
            print("朋友圈")
            action.isHidden = true
        }))
        navBar.addAction(AGNavigationBarAction(title: "关闭", position: .left, handler: { action in
            action.isEnabled = false
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
