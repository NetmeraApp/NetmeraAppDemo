//
//  SignInVC.swift
//  NetmeraPrivateApp
//
//  Created by Elif Yürektürk on 25.07.2022.
//

import UIKit
import Firebase
import AdSupport
import AppTrackingTransparency
import Netmera

import WidgetKit
import ActivityKit

class SignInVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnLogin(_ sender: Any) {
        let pass = passwordText.text ?? ""
        let email = emailText.text ?? ""
        
        if pass.isEmpty || email.isEmpty {
            print("Lütfen şifre veya email giriniz!")
            
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            
            if error != nil{
                print(error?.localizedDescription ?? "Error")
            }else{
                self.tabBarController?.selectedIndex = 0
            }
        }
    }
    
    @IBAction func btnRequestAdid(_ sender: Any) {
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
    
    
    
    @IBAction func btnAddLiveActivity(_ sender: Any) {
        addLiveActivity()
    }

    func addLiveActivity(){
        let scoreAttributes = ScoreAttributes()
        let initialContentState = ScoreAttributes.ContentState(estimatedDeliveryTime: Date().addingTimeInterval(15 * 60))

        do{
            let activity = try Activity<ScoreAttributes>.request(attributes: scoreAttributes, contentState: initialContentState, pushType: nil)
            print("Activity added succesfully. id: \(activity.id) ")
        }catch{
            print(error.localizedDescription)
        }
    }
    @IBAction func btnUserUpdate(_ sender: Any) {
        let user = MyNetmeraUser()
        user.country = "tr"
        user.language = "tr"
        user.testAttribute = 1
        user.sporx1 = 2
        user.sporxString = "spor"
        Netmera.update(user)
    }
    
    
    @IBAction func btnRequestPN(_ sender: Any) {
        Netmera.requestPushNotificationAuthorization(forTypes: [.alert, .badge, .sound])
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
