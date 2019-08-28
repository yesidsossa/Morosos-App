//
//  SplashViewController.swift
//  MorososApp
//
//  Created by Alejandro Alzate Zapata on 8/28/19.
//  Copyright © 2019 Morosos App. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func splashButton(_ sender: Any) {
        
        let preferences = UserDefaults.standard
        let isLoggedIn = "isLoggedIn"
        
        if preferences.object(forKey: isLoggedIn) == nil {
            goToLoginController()
        } else {
            goToMainMenuController()
        }
    }
    
    func goToLoginController() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginViewController") as! LoginViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
    func goToMainMenuController() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainMenuController") as! MainMenuViewController
        self.present(newViewController, animated: true, completion: nil)
    }
}
