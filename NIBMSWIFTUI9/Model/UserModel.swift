//
//  UserModel.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-09.
//

import Foundation

struct UserModel:Codable, Identifiable {
    let id = UUID()
    var name: String
    var email: String
    var phone_number: Int
    var password: String
}
