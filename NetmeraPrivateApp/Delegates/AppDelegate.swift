//
//  AppDelegate.swift
//  NetmeraPrivateApp
//
//  Created by Elif Yürektürk on 18.07.2022.
//

import UIKit
import Netmera
import Firebase
import FirebaseAnalytics
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
  



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //in didFinishLaunchingWithOptions

        if #available(iOS 10.0, *) {
        UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
          } else {
            // Fallback on earlier versions
          }
        // Override point for customization after application launch.
        Netmera.start()
   
        FirebaseApp.configure()

                // For On-premise setup
                // Netmera.setBaseURL("YOUR PANEL DOMAIN URL")

                // This can be called later, see documentation for details
        Netmera.setBaseURL("https://test.sdpaas.com/")
        Netmera.setAPIKey("gFtyH_nz5WC9m8cZcUfrB2qIGSj205HbPSzBquEEYiO0vO11EhiZfA")
      
    
                Netmera.setLogLevel(NetmeraLogLevel.debug)
        // Call this method with needed notification types
        Netmera.requestPushNotificationAuthorization(forTypes: [.alert, .badge, .sound])
        Netmera.setEnabledPopupPresentation(true)
        Netmera.setAppGroupName("group.com.Netmera.NetmeraPrivateApp")
        Netmera.requestTrackingAuthorization()
        Netmera.requestLocationAuthorization()
        let user = MyNetmeraUser()
        user.userId = "elif"
        
        Netmera.update(user)
        
     
       
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void)
    {
        
        NetmeraPushObject(dictionary: response.notification.request.content.userInfo)
        print("???????????????????")
        print(response)
        
         
      
       
        //object.alert.body                  //Push Text
        //object.alert.title                 //Push Title
        //object.action.deeplinkURL          //Push Deeplink
               //Custom JSON

//        let userInfo =  response.notification.request.content.userInfo
//        print("----------------------------!!!!!!------------------------------")
//        if let data = userInfo["subgame"] as? [String: Any],
//                    let payload = data["subgame"] as? [String: Any],
//                    let postId = payload["subgame"] as? String{
//                    print("subgame \(postId)")
//                }else{
//                    print("there is no post id inside the payload")
//                }

    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
    {
    //Netmera.recentPushObject()?.alert.body                  //Push Text
    //Netmera.recentPushObject()?.alert.title                 //Push Title
    //Netmera.recentPushObject()?.action.deeplinkURL          //Push Deeplink
        print("??????????????????--------------???????????????")
    print(Netmera.recentPushObject()?.customDictionary)        //Custom JSON
    }
//    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//            completionHandler(.alert)
//            }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
    {}

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool
    {
               
        if (url.scheme == "elif")
        {
            if (url.host == "SignInVC")
            {
                // present view controller for screenOne;
               
                    let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
                    guard let detailPage = storyBoard.instantiateViewController(withIdentifier: "SignInVC") as? SignInVC else {return false}
                 //   let navVC = self.window?.rootViewController as? UINavigationController
                   // navVC?.pushViewController(SignInVC, animated: true)
                    // windowun üzerine sayfayı açmayan
                
            }
            else if (url.host == "SignUpVC")
            {
                // present view controller for screenTwo;
            }

            // or you can use host property directly
        }
        return true
    }
    
}

