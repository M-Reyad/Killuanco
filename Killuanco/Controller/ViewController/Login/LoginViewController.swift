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
    
    //MARK:- View Controller Variables
    
    /*      -1- Constraints         */
    @IBOutlet weak var loginHeight: NSLayoutConstraint!
    @IBOutlet weak var loginWidth: NSLayoutConstraint!
    
    /*    -2- Local Outlets         */
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var signupView: UIView!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var rememberMeCheckBox: BEMCheckBox!
    
    
    /*     -3- Functions            */
    @IBAction func rememberMePressed(_ sender: UIButton) {
        if rememberMeCheckBox.on == true {
            rememberMeCheckBox.on = false
            print("Unchecked")
        }else{
            rememberMeCheckBox.on = true
            print("Checked")
        }
    }
    
//MARK:-Switching Between Signin/Signup
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
    
    
//MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
//        loginHeight.constant *= K.conversionIndex
//        loginWidth.constant *= K.conversionIndex
        signupView.isHidden = true
        if rememberMeCheckBox.on{
            print("Remember me is Checked")
        }

    }
    


}
