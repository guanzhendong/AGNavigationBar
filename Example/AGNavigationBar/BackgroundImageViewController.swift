//
//  BackgroundImageViewController.swift
//  AGNavigationBar_Example
//
//  Created by arthurguan on 2024/9/5.
//  Copyright © 2024 arthurguan. All rights reserved.
//

import UIKit
import AGNavigationBar

class BackgroundImageViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func confitNavBar() {
        AGNavigationBar.Config.backgroundImage = UIImage(named: "bg")
        super.confitNavBar()
        AGNavigationBar.Config.backgroundImage = nil
        
        navBar.title = "背景图片"
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
