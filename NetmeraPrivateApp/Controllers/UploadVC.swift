//
//  UploadVC.swift
//  NetmeraPrivateApp
//
//  Created by Elif Yürektürk on 25.07.2022.
//

import UIKit
import Netmera
import AdSupport
import AppTrackingTransparency
import Firebase

class UploadVC: UIViewController {
    
    @IBOutlet weak var category: UISegmentedControl!
    
    @IBOutlet weak var titleTxt: UITextField!
    
    @IBOutlet weak var descriptionTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Netmera.setEnabledPopupPresentation(false)
        // Do any additional setup after loading the view.
    }
    @IBAction func btnSave(_ sender: Any) {
        let title = titleTxt.text ?? ""
        let desc = descriptionTxt.text ?? ""
        let cat = category.titleForSegment(at: category.selectedSegmentIndex)
        
        let currentUser = Auth.auth().currentUser
        
        if currentUser == nil {
            
            Common.showAlert(title: "Uyarı", message: "Lütfen giriş yapınız.", vc: self)
            
            return
        }
        let newItem: Dictionary<String, Any> = [ "title": title, "desc": desc, "type": cat, "email": currentUser?.email ]
        
        createNewItem(item: newItem)
    }
    func createNewItem(item: Dictionary<String,Any>) {
        
        let firebaseNewItem = DataService.dataService.ITEM_REF.childByAutoId()
        
        firebaseNewItem.setValue(item) { (error: Error?, ref: DatabaseReference) -> Void in
            
            if error == nil {
                
                self.tabBarController?.selectedIndex = 0
                self.titleTxt.text = ""
                self.descriptionTxt.text = ""
                print("saved.")
                
            }else {
                Common.showAlert(title: "Hata", message: error?.localizedDescription ?? "Error!!!!", vc: self)
            }
        }
    }
    //        @IBAction func btnAdId(_ sender: Any) {
    //            ATTrackingManager.requestTrackingAuthorization { status in
    //                switch status {
    //                case .notDetermined:
    //                    // Tracking authorization dialog has not been shown
    //                    print("Not Determined")
    //                case .restricted:
    //                    print("Restricted")
    //                case .authorized:
    //                    // Tracking authorization dialog was shown
    //                    // and we are authorized
    //                    print("Authorized")
    //
    //                    // Now that we are authorized we can get the IDFA
    //
    //                case .denied:
    //                    // Tracking authorization dialog was
    //                    // shown and permission is denied
    //                    print("Denied")
    //
    //                @unknown default:
    //                    print("Unknown")
    //                }
    //            }
    //        }
    
    
    //    @IBAction func btnTesvik(_ sender: Any) {
    //
    //    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
