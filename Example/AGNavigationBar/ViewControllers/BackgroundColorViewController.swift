//
//  BackgroundColorViewController.swift
//  AGNavigationBar_Example
//
//  Created by arthurguan on 2024/9/5.
//  Copyright © 2024 arthurguan. All rights reserved.
//

import UIKit

class BackgroundColorViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func confitNavBar() {
        super.confitNavBar()
        
        navBar.title = "背景色"
        navBar.barTintColor = .green
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
