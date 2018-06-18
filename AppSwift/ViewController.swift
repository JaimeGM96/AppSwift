//
//  ViewController.swift
//  AppSwift
//
//  Created by Jaime on 15/6/18.
//  Copyright © 2018 Jaime. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.passwordField.isSecureTextEntry = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLoginButtonClicked(_ sender: Any) {
        if userNameField.text == "jaime" && passwordField.text == "12345" {
            
        }
    }
    
}

