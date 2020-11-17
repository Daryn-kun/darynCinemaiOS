//
//  LoginViewController.swift
//  DarynCinema
//
//  Created by nagato on 10/16/20.
//  Copyright © 2020 nagato. All rights reserved.
//

import UIKit
import Alamofire
class LoginViewController: UIViewController {

    @IBOutlet weak var roundButton: UIButton!
    @IBOutlet weak var userEmailTxtField: UITextField!
    @IBOutlet weak var userPasswordTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        roundButton.layer.cornerRadius = 10.0
        roundButton.layer.masksToBounds = true
    }


    @IBAction func loginButtonTapped(_ sender: Any) {
        let userEmail = userEmailTxtField.text
        let userPassword = userPasswordTxtField.text
        
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
        if(userEmailStored == userEmail){
            if(userPasswordStored == userPassword){
                let params = [
                    "email" : userEmail ?? "No input detected",
                    "password" : userPassword ?? "No input detected"
                ]
                Alamofire.request("https://reqres.in/api/login", method: .post, parameters: params).responseString {(response) in
                    if response.result.isSuccess{
                        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                        UserDefaults.standard.synchronize()
                        self.dismiss(animated: true, completion: nil)
                        print("Your post \(response)")
                    } else {
                        self.displayAlertMessage(userMessage: "Something went wrong")
                        print("error")
                    }
                }
            } else{
                self.displayAlertMessage(userMessage: "Incorrect password")
            }
        } else{
            self.displayAlertMessage(userMessage: "Incorrect email")
        }
        
    }
    func displayAlertMessage(userMessage: String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        myAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
            (action) in
            myAlert.dismiss(animated: true, completion: nil)
        }))
        self.present(myAlert, animated: true, completion: nil)
    }
}
