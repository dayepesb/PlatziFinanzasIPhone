//
//  SigninViewController.swift
//  PlatziFinanzas
//
//  Created by David Yepes Buitrago on 1/28/20.
//  Copyright © 2020 Platzi. All rights reserved.
//

import UIKit
import FirebaseAuth

class SigninViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func signin(_ sender: Any) {
        
        guard let email = emailTextField.text else {
            return
        }
        
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}+\\.[A-Za-z]{2,64}"
        
        let validateEmail = validateText(text: email, pattern: pattern)
        
        if !validateEmail {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) {
            [weak self](result,error) in
            if let error = error {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription,preferredStyle: .alert)
                let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
                alert.addAction(ok)
                self?.present(alert, animated: true, completion: nil)
                return
            }
            
            if result != nil {
                self?.performSegue(withIdentifier: "goToMain", sender: self)
            }
        }
    }
    
    fileprivate func validateText(text: String, pattern: String)-> Bool{
        let range = NSRange(location: 0, length: text.count)
        
        let regex = try? NSRegularExpression(pattern: pattern)
        
        let validtaion = regex?.firstMatch(in: text, options: [], range: range)
        
        return validtaion==nil
    }
}
