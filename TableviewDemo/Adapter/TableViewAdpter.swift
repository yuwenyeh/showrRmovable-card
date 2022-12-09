//
//  TableViewAdpter.swift
//  TableviewDemo
//
//  Created by 葉育彣 on 2022/10/21.
//

import UIKit


public class TableViewAdpter: NSObject {
    
    
    public weak var tableView: UITableView?
   
    
    
    public init(tableview: UITableView) {
        self.tableView = tableview
       // self.tableView?.delegate = self
       // self.tableView?.dataSource = self
    }
    
  
}

//extension TableViewAdpter: UITableViewDataSource {
   // public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
   // }
    
    
   // public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
   // }
    
//}

//extension TableViewAdpter: UITableViewDelegate {
    
//}

