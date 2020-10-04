//
//  SignInView.swift
//  yavka
//
//  Created by Сергей Журавлёв on 04.10.2020.
//  Copyright © 2020 Сергей Журавлёв. All rights reserved.
//

import UIKit

class SignInView: UIView {
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    
    let logoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "yaVKa"
        label.font = UIFont(name: "Noteworthy", size: 52)
        return label
    }()
    
    let loginTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Имя пользователя"
        tf.text = "admin"
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Пароль"
        tf.textContentType = .password
        tf.isSecureTextEntry = true
        tf.text = "admin"
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let signInButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .systemBlue
        b.setTitle("Войти", for: .normal)
        b.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 20)
        //b.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        return b
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(tapGesture)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    func checkLoginAndPassword() -> Bool{
        guard let loginText = loginTextField.text else { return false }
        guard let pwdText = passwordTextField.text else { return false }
        
        if loginText == "admin", pwdText == "admin" {
            return true
        } else {
            return false
        }
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
        NSLayoutConstraint.activate([
            logoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
        ])
        NSLayoutConstraint.activate([
            loginTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            loginTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            loginTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
        NSLayoutConstraint.activate([
            signInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 100),
//            signInButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -200),
            signInButton.widthAnchor.constraint(equalToConstant: 70),
            signInButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setup() {
        addSubview(scrollView)
        scrollView.addSubview(logoLabel)
        scrollView.addSubview(loginTextField)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(signInButton)
        
        setNeedsUpdateConstraints()
    }
}
