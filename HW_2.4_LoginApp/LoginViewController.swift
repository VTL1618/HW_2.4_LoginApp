//
//  ViewController.swift
//  HW_2.4_LoginApp
//
//  Created by Vitaly Zubenko on 13.05.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: IBOutlets
    // получается тут должны быть только те аутлеты которые участвуют только в этом вьюконтроллере
    @IBOutlet var userNameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    //это все не нужно то что я налепил
//    @IBOutlet var loginButton: UIButton!
//    @IBOutlet var forgotUserNameButton: UIButton!
//    @IBOutlet var forgotPassButton: UIButton!
    
    // MARK: Private properties
    private let user = User.getUserData()
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    // MARK: Navigations
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let welcomeVC = tabBarController.viewControllers?.first as! WelcomeViewController
        let navigationVC = tabBarController.viewControllers?.last as! UINavigationController
        let aboutUserVC = navigationVC.topViewController as! AboutMeViewController
        welcomeVC.user = user
        aboutUserVC.user = user
    }

    // MARK: IBActions
    @IBAction func loginAction() {
        guard
            userNameField.text == user.login,
            passwordField.text == user.password
        else {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login or password",
                      textField: passwordField)
            return
        }
        
        performSegue(withIdentifier: "logIn", sender: nil)
    }
    
    @IBAction func forgotUserNameAction() {
        showAlert(title: "Oops!", message: "Your name is \"\(user.login)\" 😉")
    }
    
    @IBAction func forgotPassAction() {
        showAlert(title: "Oops!", message: "Your password is \"\(user.password)\" 😉")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameField.text = nil
        passwordField.text = nil
    }
    
}

// MARK: Alert Controller
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            _ in textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


// MARK: Text Field Delegate
extension LoginViewController: UITextViewDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameField {
            passwordField.becomeFirstResponder()
        } else {
            loginAction()
        }
        return true
    }
    
}
