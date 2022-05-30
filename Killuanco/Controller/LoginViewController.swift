//
//  LoginViewController.swift
//  Killuanco
//
//  Created by Muhammad Reyadh on 5/29/22.
//  Copyright © 2022 PA&A. All rights reserved.
//

import UIKit
import ShowPasswordTextField
import BEMCheckBox



class LoginViewController: UIViewController {
    
    

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var signupView: UIView!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var signinButton: UIButton!
    
    @IBOutlet weak var rememberMeCheckBox: BEMCheckBox!
//    @IBOutlet weak var rememberMeButton: UIButton!
    
    
    @IBAction func rememberMePressed(_ sender: UIButton) {
        if rememberMeCheckBox.on == true {
            rememberMeCheckBox.on = false
            print("Unchecked")
        }else{
            rememberMeCheckBox.on = true
            print("Checked")
        }
    }
    
    
    @IBAction func signupButtonPressed(_ sender: Any) {

        print("signupButton Pressed")
        signinButton.isSelected = false
        signupButton.isSelected = true
        signupView.isHidden = false
        loginView.isHidden = true
        
    }
    
    @IBAction func signinButtonPressed(_ sender: Any) {
        print("SigninButton Pressed")
        signupButton.isSelected = false
        signinButton.isSelected = true
        signupView.isHidden = true
        loginView.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        signupView.isHidden = true
        if rememberMeCheckBox.on{
            print("Remember me is Checked")
        }
        // Do any additional setup after loading the view.
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
