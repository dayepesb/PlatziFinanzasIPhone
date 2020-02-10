//
//  SigninViewController.swift
//  PlatziFinanzas
//
//  Created by David Yepes Buitrago on 1/28/20.
//  Copyright © 2020 Platzi. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import Firebase
import GoogleSignIn

class SigninViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    private var viewModel = SignInViewModel()
    @IBOutlet weak var signInButtonGoogle: GIDSignInButton!
    
    override func viewDidLoad() {
      super.viewDidLoad()

    GIDSignIn.sharedInstance()?.presentingViewController = self
    GIDSignIn.sharedInstance().signIn()


    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.authAccountKit(sender: self) { (success, error) in
            
        }
    }
    

    @IBAction func signin(_ sender: Any) {
        
        SignInViewModel.signInWith(
            email: emailTextField.text,
            password: passwordTextField.text
        ) { [weak self] (success, error) in
                
            if let error = error {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(ok)
                self?.present(alert, animated: true, completion: nil)
                return
            }
            
            if success {
                self?.performSegue(withIdentifier: "goToMain", sender: self)
            }
        }
    }
    
    @IBAction func facebookLogin(_ sender: Any) {
        
        SignInViewModel.facebookLogin(
        viewController: self
        ) { [weak self] (success, error) in
            if let error = error {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(ok)
                self?.present(alert, animated: true, completion: nil)
                return
            }
            
            if success {
                self?.performSegue(withIdentifier: "goToMain", sender: self)
            }
        }
                
        
    }
}
