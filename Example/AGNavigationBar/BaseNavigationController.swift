//
//  BaseNavigationController.swift
//  AGNavigationBar_Example
//
//  Created by arthurguan on 2024/7/22.
//  Copyright © 2024 arthurguan. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setNavigationBarHidden(true, animated: false)
        
        let target = interactivePopGestureRecognizer?.delegate
        let pan = UIPanGestureRecognizer(target: target, action: #selector(handleNavigationTransition(_:)))
        pan.delegate = self
        view.addGestureRecognizer(pan)
        interactivePopGestureRecognizer?.isEnabled = false
    }
    
    @objc func handleNavigationTransition(_ gestureRecognizer: UIGestureRecognizer) {
        
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
