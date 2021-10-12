//
//  UserAuth.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-17.
//

import Foundation

class UserAuth: ObservableObject {
    @Published var isLoggedOut = false     // published property to update view

    func login() {
        // login request... on success:
//        self.isLoggedin = true
    }

    func logout() {
        UserDefaults.standard.set(nil, forKey: "email")
        UserDefaults.standard.removeObject(forKey: "Auth")
        isLoggedOut = true
        print("done calling logout")
    }
    
}
