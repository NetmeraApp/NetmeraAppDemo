//
//  DataService.swift
//  NetmeraPrivateApp
//
//  Created by Elif Yürektürk on 25.07.2022.
//

import Foundation
import Firebase
import FirebaseAnalytics

let BASE_URL = "https://netmeraprivateapp-default-rtdb.firebaseio.com"
class DataService{
    static let dataService = DataService()
    
    private var _BASE_REF = Database.database().reference(fromURL: "\(BASE_URL)")
    private var _ITEM_REF = Database.database().reference(fromURL: "\(BASE_URL)/item")
  
    
    var BASE_REF: DatabaseReference{
        return _BASE_REF
    }
    var ITEM_REF: DatabaseReference{
        return _ITEM_REF
    }
}
