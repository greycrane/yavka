//
//  ViewController.swift
//  yavka
//
//  Created by Сергей Журавлёв on 29.07.2020.
//  Copyright © 2020 Сергей Журавлёв. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginField.text = "admin"
        passwordField.text = "admin"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillBeShown(notification: Notification) {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 20.0, right: 0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    @objc func hideKeyboard() {
        scrollView.endEditing(true)
    }
    
    private func showSignInError() {
        let alert = UIAlertController(title: "Ошибка", message: "Неверное имя пользователя и/или пароль.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func checkLoginAndPassword() -> Bool{
        guard let loginText = loginField.text else { return false }
        guard let pwdText = passwordField.text else { return false }
        
        if loginText == "admin", pwdText == "admin" {
            return true
        } else {
            return false
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "signInSegue" {
            if checkLoginAndPassword() {
                let session = Session.shared
                session.token = (loginField.text)! + "_token"
                session.userId = 1
                return true
            } else {
                showSignInError()
                return false
            }
        }
        return true
    }
}
