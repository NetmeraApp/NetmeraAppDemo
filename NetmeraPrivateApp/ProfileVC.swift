//
//  ProfileVC.swift
//  NetmeraPrivateApp
//
//  Created by Elif Yürektürk on 7.11.2022.
//

import UIKit

import Firebase
import FirebaseStorage


class ProfileVC: UIViewController {
    //Fotoğrafın gözükmesi için imageView
    @IBOutlet weak var profileImage: UIImageView!
    
    var imagePicker: ImagePicker!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    
    }
  //Profil fotoğrafı eklemek için buton
    @IBAction func btnUploadImage(_ sender: Any) {
        self.imagePicker.present(from: sender as! UIView)
        //Profil fotoğrafının yuvarlak gözükmesi için
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.clipsToBounds = true
  
    }
}
    extension ProfileVC: ImagePickerDelegate {

        func didSelect(image: UIImage?) {
            self.profileImage?.image = image
        }
    }

 
