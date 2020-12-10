//
//  EditProfileViewController.swift
//  DarynCinema
//
//  Created by nagato on 12/8/20.
//  Copyright © 2020 nagato. All rights reserved.
//

import UIKit
import ContactsUI
import RealmSwift
class EditProfileViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var addProfileBtn: UIButton!
    @IBOutlet weak var addPhoneBtn: UIButton!
    let contactsController = CNContactPickerViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = realm.object(ofType: User.self, forPrimaryKey: 0)
        self.emailTextField.text = user!.userEmail
        self.fullNameTextField.text = user!.fullName
        self.phoneNumberLbl.text = user?.userContact
        if(user?.userImg != nil){
            let image : UIImage = UIImage(data: user!.userImg! as Data)!
            self.profileImageView.image = image
        }
        addProfileBtn.layer.cornerRadius = 10.0
        addProfileBtn.layer.masksToBounds = true
        addPhoneBtn.layer.cornerRadius = 10.0
        addPhoneBtn.layer.masksToBounds = true
    }

    @IBAction func addPhoneNumTapped(_ sender: Any) {
        contactsController.delegate = self
        self.present(contactsController, animated: true, completion: nil)
    }
    @IBAction func addProfileImgTapped(_ sender: Any) {
        showImagePickerControllerActionSheet()
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        let myProfile = User()
        myProfile.userContact = phoneNumberLbl.text
        let data = NSData(data: profileImageView.image!.jpegData(compressionQuality: 0.9)!)
        myProfile.userImg = data
        myProfile.fullName = fullNameTextField.text
        myProfile.userEmail = emailTextField.text
        myProfile.id = 0
        try! realm.write{
            realm.add(myProfile, update: .modified)
        }
        navigationController?.popViewController(animated: true)
    }
}
extension EditProfileViewController: CNContactPickerDelegate{
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        let userPhoneNumbers:[CNLabeledValue<CNPhoneNumber>] = contact.phoneNumbers
        let firstPhoneNumber:CNPhoneNumber = userPhoneNumbers[0].value

        // user phone number string
        self.phoneNumberLbl.text = firstPhoneNumber.stringValue
    }
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func showImagePickerControllerActionSheet(){
        let photoLibraryAction = UIAlertAction(title: "Choose from Gallery", style: .default){ (action)
            in
            self.showImagePickerController(sourceType: .photoLibrary)
        }
        let cameraAction = UIAlertAction(title: "Take a Photo", style: .default){ (action)
            in
            self.showImagePickerController(sourceType: .camera)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        AlertService.showAlert(style: .actionSheet, title: "Choose your image", message: nil, actions: [photoLibraryAction, cameraAction, cancelAction], completion: nil)
    }
    func showImagePickerController(sourceType: UIImagePickerController.SourceType){
        let image = UIImagePickerController()
        image.delegate = self
        image.allowsEditing = true
        image.sourceType = sourceType
        present(image, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            self.profileImageView.image = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.profileImageView.image = originalImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}
