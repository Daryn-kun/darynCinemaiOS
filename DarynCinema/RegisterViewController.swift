//
//  RegisterViewController.swift
//  DarynCinema
//
//  Created by nagato on 10/16/20.
//  Copyright © 2020 nagato. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var userEmailTxtField: UITextField!
    @IBOutlet weak var userPasswordTxtField: UITextField!
    @IBOutlet weak var confirmPasswordTxtField: UITextField!
    @IBOutlet weak var roundButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        roundButton.layer.cornerRadius = 10.0
        roundButton.layer.masksToBounds = true


    }
    
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let userEmail = userEmailTxtField.text
        let userPassword = userPasswordTxtField.text
        let userConfirmPassword = confirmPasswordTxtField.text
        
        
        // Check for empty fields
        if(userEmail!.isEmpty || userPassword!.isEmpty || userConfirmPassword!.isEmpty){
            //Display alert message
            displayAlertMessage(userMessage: "All fiels are required")
            return
        }
        
        if(userPassword != userConfirmPassword){
            displayAlertMessage(userMessage: "Password do not match")
            return
        }
        
        // Store data
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        UserDefaults.standard.set(userPassword, forKey: "userPassword")
        UserDefaults.standard.synchronize()
        let params = [
            "email" : userEmail ?? "No input detected",
            "password" : userPassword ?? "No input detected"
        ]
        Alamofire.request("https://reqres.in/api/register", method: .post, parameters: params).responseString {(response) in
            if response.result.isSuccess{
                let myAlert = UIAlertController(title: "Alert", message: "Succesfully signed up!", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
                    (action) in
                    myAlert.dismiss(animated: true, completion: nil)
                    self.dismiss(animated: true, completion: nil)
                    
                }
                
                myAlert.addAction(okAction)
                self.present(myAlert, animated: true, completion: nil)
                print("Your post \(response)")
            } else {
                self.displayAlertMessage(userMessage: "Something went wrong")
                print("error")
            }
        }
        
        // Display alert with confirmation
        
        
    }
    
    @IBAction func accountHaveButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
