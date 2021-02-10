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

class SignupViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var gmailButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var signUpButton: SignupButton!
    
    //MARK:- Properties
    var isLoggingIn = false
    let facebookLoginButton = FBLoginButton(frame: .zero, permissions: [.publicProfile])
    
    //MARK:- View Lifecycle & Configuration
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstName.text = ""
        lastName.text = ""
        email.text = ""
        
        //GMAIL sign in
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
        
    }
    
    @IBAction func googleSignInClicked(sender: UIButton) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    
    @IBAction func facebookSignInClicked(_ sender: FBButton) {
        facebookLoginButton.sendActions(for: .touchUpInside)
    }
    
    @IBAction func signUpButtonClicked(_ sender: UIButton) {
        email.resignFirstResponder()
        lastName.resignFirstResponder()
        firstName.resignFirstResponder()
        
        guard let firstName = firstName.text, !firstName.isEmpty else {
            let alert = UIAlertController(title: "Invalid name?", message: "Please enter valid name!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            return
        }
        guard let lastName = lastName.text, !lastName.isEmpty else {
            let alert = UIAlertController(title: "Invalid Last Name?", message: "Please enter valid  last name!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            return
        }
        guard let email = email.text, !email.isEmpty else {
            let alert = UIAlertController(title: "Invalid Email", message: "Please enter a valid email address!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            
            return
        }
                //Navigate to the TrackViewController
        performSegue(withIdentifier: "trackVC", sender: self)
    }
}


// MARK: - GMAIL sign up delegate
extension SignupViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        let authentication = user.authentication
        print("Access token:", authentication?.accessToken! as Any)
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
    }
    
}

extension SignupViewController {
    
    func initializeHideKeyboard(){
        //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        
        //Add this tap gesture recognizer to the parent view
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){
        //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
        //In short- Dismiss the active keyboard.
        view.endEditing(true)
    }
    
}

