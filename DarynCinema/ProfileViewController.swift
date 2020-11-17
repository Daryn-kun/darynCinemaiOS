//
//  ProfileViewController.swift
//  DarynCinema
//
//  Created by nagato on 10/16/20.
//  Copyright © 2020 nagato. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usersNameLbl: UILabel!
    @IBOutlet weak var roundButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        usersNameLbl.text = UserDefaults.standard.string(forKey: "userEmail")
        roundButton.layer.cornerRadius = 10.0
        roundButton.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 10.0
        profileImageView.layer.masksToBounds = true
    }

    @IBAction func logoutButtonTap(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
        self.performSegue(withIdentifier: "loginView2", sender: self)
    }


}
