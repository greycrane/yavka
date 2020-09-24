//
//  Session.swift
//  yavka
//
//  Created by Сергей Журавлёв on 24.09.2020.
//  Copyright © 2020 Сергей Журавлёв. All rights reserved.
//

import Foundation

class Session {
    static let shared = Session()
    
    var token: String?
    var userId: Int?
    
    private init() {}
}
