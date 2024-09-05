//
//  ThirdViewController.swift
//  AGNavigationBar_Example
//
//  Created by arthurguan on 2024/9/2.
//  Copyright © 2024 arthurguan. All rights reserved.
//

import UIKit
import AGNavigationBar

class ThirdViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }


    override func confitNavBar() {
        super.confitNavBar()
        
        navBar.title = "设置"
        navBar.barTintColor = .blue
        navBar.addAction(AGNavigationBarAction(title: "保存", position: .right, handler: { action in
        }))
    }
    
}

extension ThirdViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        let offsetY = min(200, max(0, scrollView.contentOffset.y))
        let alpha = 1 - offsetY / 200
        navBar.barTintColor = .blue.withAlphaComponent(alpha)
        
    }
}
