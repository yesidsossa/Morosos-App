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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = loginButton.frame.height/2
        // Do any additional setup after loading the view.
    }
    
    func login() -> Bool {
        if userNameTextField.text == "aportes" && passwordTextField.text == "voluntarios" {
            return true
        }
        return false
    }
    
    func savePreference(){
       
    }
    
    func goToNextController() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainMenuController") as! MainMenuViewController
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
