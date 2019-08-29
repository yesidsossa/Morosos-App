//
//  LoginViewController.swift
//  MorososApp
//
//  Created by Alejandro Alzate Zapata on 8/28/19.
//  Copyright © 2019 Morosos App. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
   
    @IBAction func exit(_ sender: Any) {
        self.hideKeyboardWhenTappedAround()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = loginButton.frame.height/2
    }
  
    func login() -> Bool {
        if userNameTextField.text == "aportes" && passwordTextField.text == "voluntarios" {
            return true
        }
        return false
    }
    
    func savePreference() -> Void {
        let preferences = UserDefaults.standard
        let isLoggedIn = "isLoggedIn"
        
        preferences.set(true, forKey: isLoggedIn)
        preferences.synchronize()
    }
    
    func goToNextController() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainMenuController") as! UINavigationController
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if login(){
            savePreference()
            goToNextController()
            }else{
            let alert = UIAlertController(title: "¡Multa!", message: "Por haber ingresado el usuario y/o la contraseña incorrecta, debes mil", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
