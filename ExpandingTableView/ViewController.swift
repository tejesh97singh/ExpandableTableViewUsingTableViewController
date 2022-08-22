//
//  ViewController.swift
//  ExpandingTableView
//
//  Created by Tejesh singh on 02/08/22.
//

import UIKit

struct cellData {
    var forExapanding = Bool()
    var TopCellTitle = String()
    var ExpandedCellData = [String]()
}

class TableViewController: UITableViewController {
    
    var tableViewData = [cellData]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
       tableViewData = [cellData(forExapanding: false, TopCellTitle: "First Section", ExpandedCellData: ["Score 1", "Score 2", "Score 3"]),
                        cellData(forExapanding: false, TopCellTitle: "Second Section", ExpandedCellData: ["Score 4", "Score 5", "Score 6"]),
                        cellData(forExapanding: false, TopCellTitle: "Third Section", ExpandedCellData: ["Score 7", "Score 8", "Score 9"]),
                        cellData(forExapanding: false, TopCellTitle: "Fourth Section", ExpandedCellData: ["Score 10", "Score 11", "Score 12"])]
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        print(tableViewData.count)
        return tableViewData.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].forExapanding == true{
            print(tableViewData[section].ExpandedCellData.count + 1)
            return tableViewData[section].ExpandedCellData.count + 1
        }
        else{
            return 1
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell") else { return UITableViewCell() }
                    cell.textLabel?.text = tableViewData[indexPath.section].TopCellTitle
                    cell.textLabel?.textColor = UIColor.systemOrange
                    cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
                    return cell
                }
                else{
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell") else { return UITableViewCell() }
                    cell.textLabel?.text = tableViewData[indexPath.section].ExpandedCellData[indexPath.row - 1]
                    cell.textLabel?.textColor = UIColor.systemGray
                    cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
                    return cell
                }
            }
            override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                if indexPath.row == 0{
                    if tableViewData[indexPath.section].forExapanding  == true{
                        tableViewData[indexPath.section].forExapanding = false
                        let sections = IndexSet.init(integer: indexPath.section)
                        tableView.reloadSections(sections, with: .none)
                    }
                    else{
                        tableViewData[indexPath.section].forExapanding = true
                        let sections = IndexSet.init(integer: indexPath.section)
                        tableView.reloadSections(sections, with: .none)        }
                }
            }

        }

