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

    let monkeyAnimationView = AnimationView()
    let moneyAnimationView1 = AnimationView()
    let moneyAnimationView2 = AnimationView()
    let moneyAnimationView3 = AnimationView()
    let moneyAnimationView4 = AnimationView()
    let moneyAnimationView5 = AnimationView()
    let moneyAnimationView6 = AnimationView()
    
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAnimation()
    }
    
    func setAnimation(){
        let monkeyAnimation = Animation.named("splash_animation")
        let moneyAnimation1 = Animation.named("money_animation")
        let moneyAnimation2 = Animation.named("money_animation")
        let moneyAnimation3 = Animation.named("money_animation")
        let moneyAnimation4 = Animation.named("money_animation")
        let moneyAnimation5 = Animation.named("money_animation")
        let moneyAnimation6 = Animation.named("money_animation")
        
        monkeyAnimationView.animation = monkeyAnimation
        monkeyAnimationView.translatesAutoresizingMaskIntoConstraints = false
        
        moneyAnimationView1.animation = moneyAnimation1
        moneyAnimationView1.translatesAutoresizingMaskIntoConstraints = false
        
        moneyAnimationView2.animation = moneyAnimation2
        moneyAnimationView2.translatesAutoresizingMaskIntoConstraints = false
        
        moneyAnimationView3.animation = moneyAnimation3
        moneyAnimationView3.translatesAutoresizingMaskIntoConstraints = false
        
        moneyAnimationView4.animation = moneyAnimation4
        moneyAnimationView4.translatesAutoresizingMaskIntoConstraints = false
        
        moneyAnimationView5.animation = moneyAnimation5
        moneyAnimationView5.translatesAutoresizingMaskIntoConstraints = false
        
        moneyAnimationView6.animation = moneyAnimation6
        moneyAnimationView6.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(monkeyAnimationView)
        containerView.addSubview(moneyAnimationView1)
        containerView.addSubview(moneyAnimationView2)
        containerView.addSubview(moneyAnimationView3)
        containerView.addSubview(moneyAnimationView4)
        containerView.addSubview(moneyAnimationView5)
        containerView.addSubview(moneyAnimationView6)
        
        setConstraints()
        playAnimations()
    }
    
    func setConstraints() {
        monkeyAnimationView.heightAnchor.constraint(equalToConstant: containerView.frame.width).isActive = true
        monkeyAnimationView.widthAnchor.constraint(equalToConstant: containerView.frame.width).isActive = true
        monkeyAnimationView.centerYAnchor.constraint(equalToSystemSpacingBelow: self.view.centerYAnchor, multiplier: 0).isActive = true
        
        moneyAnimationView1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        moneyAnimationView1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        moneyAnimationView1.topAnchor.constraint(greaterThanOrEqualTo: containerView.topAnchor, constant: 40).isActive = true
        moneyAnimationView1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40).isActive = true
        moneyAnimationView1.bottomAnchor.constraint(equalTo: monkeyAnimationView.topAnchor, constant: 20).isActive = true
        
        moneyAnimationView2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        moneyAnimationView2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        moneyAnimationView2.topAnchor.constraint(greaterThanOrEqualTo: containerView.topAnchor, constant: 40).isActive = true
        moneyAnimationView2.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40).isActive = true
        moneyAnimationView2.bottomAnchor.constraint(equalTo: monkeyAnimationView.topAnchor, constant: 20).isActive = true
        
        moneyAnimationView3.heightAnchor.constraint(equalToConstant: 100).isActive = true
        moneyAnimationView3.widthAnchor.constraint(equalToConstant: 100).isActive = true
        moneyAnimationView3.topAnchor.constraint(equalTo: monkeyAnimationView.bottomAnchor, constant: -20).isActive = true
        moneyAnimationView3.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40).isActive = true
        moneyAnimationView3.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -40).isActive = true
        
        moneyAnimationView4.heightAnchor.constraint(equalToConstant: 100).isActive = true
        moneyAnimationView4.widthAnchor.constraint(equalToConstant: 100).isActive = true
        moneyAnimationView4.topAnchor.constraint(equalTo: monkeyAnimationView.bottomAnchor, constant: -20).isActive = true
        moneyAnimationView4.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40).isActive = true
        moneyAnimationView4.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -40).isActive = true
        
        moneyAnimationView5.heightAnchor.constraint(equalToConstant: 100).isActive = true
        moneyAnimationView5.widthAnchor.constraint(equalToConstant: 100).isActive = true
        moneyAnimationView5.centerYAnchor.constraint(equalToSystemSpacingBelow: self.view.centerYAnchor, multiplier: 0).isActive = true
        moneyAnimationView5.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        
        moneyAnimationView6.heightAnchor.constraint(equalToConstant: 100).isActive = true
        moneyAnimationView6.widthAnchor.constraint(equalToConstant: 100).isActive = true
        moneyAnimationView6.centerYAnchor.constraint(equalToSystemSpacingBelow: self.view.centerYAnchor, multiplier: 0).isActive = true
        moneyAnimationView6.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
    }
    
    func playAnimations() {
        moneyAnimationView1.loopMode = .loop
        moneyAnimationView2.loopMode = .loop
        moneyAnimationView3.loopMode = .loop
        moneyAnimationView4.loopMode = .loop
        moneyAnimationView5.loopMode = .loop
        moneyAnimationView6.loopMode = .loop
        
        moneyAnimationView1.animationSpeed = 1.5
        moneyAnimationView2.animationSpeed = 1.5
        moneyAnimationView3.animationSpeed = 1.5
        moneyAnimationView4.animationSpeed = 1.5
        moneyAnimationView5.animationSpeed = 1.5
        moneyAnimationView6.animationSpeed = 1.5
        
        moneyAnimationView1.play()
        moneyAnimationView2.play()
        moneyAnimationView3.play()
        moneyAnimationView4.play()
        moneyAnimationView5.play()
        moneyAnimationView6.play()
        
        monkeyAnimationView.animationSpeed = 0.7
        monkeyAnimationView.play(fromProgress: 0.6, toProgress: 0.75, loopMode: .repeatBackwards(2.5)) { (true) in
            self.goToNextController()
        }
    }
    
    func goToNextController() {
        let preferences = UserDefaults.standard
        let isLoggedIn = "isLoggedIn"
        
        if preferences.object(forKey: isLoggedIn) == nil {
            self.goToLoginController()
        } else {
            self.goToMainMenuController()
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
