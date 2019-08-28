//
//  SplashViewController.swift
//  MorososApp
//
//  Created by Alejandro Alzate Zapata on 8/28/19.
//  Copyright © 2019 Morosos App. All rights reserved.
//
import Lottie
import UIKit

class SplashViewController: UIViewController {

    let animationView = AnimationView()
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setAnimation()
    }
    
    func setAnimation(){
        let animation = Animation.named("splash_animation")
        animationView.animation = animation
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalToConstant: containerView.frame.height).isActive = true
        animationView.widthAnchor.constraint(equalToConstant: containerView.frame.width).isActive = true
        animationView.loopMode = LottieLoopMode.repeat(2)
        containerView.addSubview(animationView)
        
        animationView.play { (true) in
            let preferences = UserDefaults.standard
            let isLoggedIn = "isLoggedIn"
            
            if preferences.object(forKey: isLoggedIn) == nil {
                self.goToLoginController()
            } else {
                self.goToMainMenuController()
            }
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
