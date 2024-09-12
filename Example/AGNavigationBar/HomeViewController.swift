//
//  HomeViewController.swift
//  AGNavigationBar_Example
//
//  Created by arthurguan on 2024/9/5.
//  Copyright © 2024 arthurguan. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var headerData = [
        "背景",
        "标题",
        "按钮",
        "透明度",
    ]
    
    var tableData = [
        ["设置背景色",
         "设置背景图片",],
        ["设置富文本标题",
         "设置超长的标题",],
        ["设置导航按钮",
         "改变导航按钮（标题、图片、是否可用、是否隐藏）",
         "隐藏返回按钮",],
        ["设置颜色透明度（跟随滚动）",],
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.rowHeight = 60
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return headerData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableData[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = tableData[indexPath.section][indexPath.row]
        cell.textLabel?.numberOfLines = 0

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                navigationController?.pushViewController(BackgroundColorViewController(), animated: true)
            case 1:
                navigationController?.pushViewController(BackgroundImageViewController(), animated: true)
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                navigationController?.pushViewController(TitleTextAttributesViewController(), animated: true)
            case 1:
                navigationController?.pushViewController(LongTitleViewController(), animated: true)
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case 0:
                navigationController?.pushViewController(BarActionViewController(), animated: true)
            case 1:
                navigationController?.pushViewController(ChangeBarActionViewController(), animated: true)
            case 2:
                navigationController?.pushViewController(HideBackActionViewController(), animated: true)
            default:
                break
            }
        case 3:
            switch indexPath.row {
            case 0:
                navigationController?.pushViewController(ChangeAlphaViewController(), animated: true)
            default:
                break
            }
        default:
            break
        }
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        headerData[section]
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
