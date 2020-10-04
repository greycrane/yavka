//
//  SignInViewVK.swift
//  yavka
//
//  Created by Сергей Журавлёв on 04.10.2020.
//  Copyright © 2020 Сергей Журавлёв. All rights reserved.
//

import UIKit
import WebKit

class SignInViewVK: WKWebView {
    
    let webView = WKWebView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
    //let request = URLRequest(url: link)

    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = "oauth.vk.com"
    urlComponents.path = "/authorize"
    urlComponents.queryItems = [
        URLQueryItem(name: "client_id", value: "1234567"),
        URLQueryItem(name: "display", value: "mobile"),
        URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
        URLQueryItem(name: "scope", value: "262150"),
        URLQueryItem(name: "response_type", value: "token"),
        URLQueryItem(name: "v", value: "5.68")
    ]
    
    let request = URLRequest(url: urlComponents.url!)
    
    webview.load(request)
}
