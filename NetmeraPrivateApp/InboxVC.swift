//
//  InboxVC.swift
//  NetmeraPrivateApp
//
//  Created by Elif Yürektürk on 17.11.2022.
//

import UIKit
import Netmera

class InboxVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
//    let filter = NetmeraInboxFilter()
//    // Default value is NetmeraInboxStatusRead | NetmeraInboxStatusUnread
//    filter.status = NetmeraInboxStatus.all
//    // Default value is NSUIntegerMax
//    //filter.pageSize = 20
//    // Default value is nil
//    filter.categories = ["category_1", "category_2"]
//    // Default value is NO
//    filter.shouldIncludeExpiredObjects = true
//    
//    Netmera.fetchInbox(using: filter, completion: {(_ inbox: NetmeraInbox, _ error: Error?) -> Void in
//                if error != nil {
//                    print("Error : \(String(describing: error?.localizedDescription))")
//                }
//                // Store returned inbox object for future operations
//           // var localInbox: NetmeraInbox?  //local inbox definition global variable
//                localInbox = inbox
//            })
//    
}
