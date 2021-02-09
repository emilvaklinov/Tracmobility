//
//  ViewController.swift
//  Tracmobility
//
//  Created by Emil Vaklinov on 09/02/2021.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn
import Auth0

class ViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var gmailButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var signUpButton: SignupButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        facebookLoginButton()
    }
    
    func facebookLoginButton() {
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
        loginButton.permissions = ["public_profile", "email"]
    }

    /// Check for an existing token at load
//    func accessTokenFacebook() {
//    if let token = AccessToken.current,
//        !token.isExpired {
//        // User is logged in, do work such as go to next view controller.
//    }
// )
    
}

