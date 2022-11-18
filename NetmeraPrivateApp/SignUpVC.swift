//
//  SignUpVC.swift
//  NetmeraPrivateApp
//
//  Created by Elif Yürektürk on 25.07.2022.
//

import UIKit
import Firebase
class SignUpVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnRegister(_ sender: Any) {
        let pass = password.text ?? ""
        let repeatPassword = repeatPassword.text ?? ""
        let email = emailText.text ?? ""
        
        if pass.isEmpty || email.isEmpty || repeatPassword != pass {
            
            Common.showAlert(title: "Bilgileri kontrol ediniz", message: "Lütfen şifre ve email giriniz", vc: self)
            return
        }
        createUser(email: email, password: pass)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func createUser(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password){ (result ,error) in
            if error != nil {
                Common.showAlert(title: "Uyarı!", message: error?.localizedDescription ?? "Kullanıcı oluşturulamadı", vc: self)
            }else{
                _ = self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }

}
