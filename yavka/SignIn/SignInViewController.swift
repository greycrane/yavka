//
//  ViewController.swift
//  yavka
//
//  Created by Сергей Журавлёв on 29.07.2020.
//  Copyright © 2020 Сергей Журавлёв. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        
        view = SignInView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    private func showSignInError() {
        let alert = UIAlertController(title: "Ошибка", message: "Неверное имя пользователя и/или пароль.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        if identifier == "signInSegue" {
//            if checkLoginAndPassword() {
//                let session = Session.shared
//                session.token = (loginField.text)! + "_token"
//                session.userId = 1
//                return true
//            } else {
//                showSignInError()
//                return false
//            }
//        }
//        return true
//    }

    
}
