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
class UploadVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Netmera.setEnabledPopupPresentation(false)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAdId(_ sender: Any) {
        ATTrackingManager.requestTrackingAuthorization { status in
                    switch status {
                    case .notDetermined:
                        // Tracking authorization dialog has not been shown
                        print("Not Determined")
                    case .restricted:
                        print("Restricted")
                    case .authorized:
                        // Tracking authorization dialog was shown
                        // and we are authorized
                        print("Authorized")
                        
                        // Now that we are authorized we can get the IDFA
                       
                    case .denied:
                        // Tracking authorization dialog was
                        // shown and permission is denied
                        print("Denied")
                    
                    @unknown default:
                        print("Unknown")
                    }
                }
    }
    
    @IBAction func btnTesvik(_ sender: Any) {
        
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
