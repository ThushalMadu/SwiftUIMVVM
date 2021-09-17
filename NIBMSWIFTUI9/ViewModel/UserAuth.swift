//
//  UserAuth.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-17.
//

import Foundation

class UserAuth: ObservableObject {
    @Published var isLoggedin = false     // published property to update view

    func login() {
        // login request... on success:
        self.isLoggedin = true
    }

    func logout() {
        // login request... on success:
        self.isLoggedin = false
    }
}
