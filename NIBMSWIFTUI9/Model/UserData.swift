//
//  UserData.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-25.
//

import Foundation

class UserData: Codable {
    let message: String
    let userExists: UserExists
    let token: String

    init(message: String, userExists: UserExists, token: String) {
        self.message = message
        self.userExists = userExists
        self.token = token
    }
}

class UserExists: Codable {
    let id, name, email: String
    let phoneNumber: Int
    let password, date: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, email
        case phoneNumber = "phone_number"
        case password, date
        case v = "__v"
    }

    init(id: String, name: String, email: String, phoneNumber: Int, password: String, date: String, v: Int) {
        self.id = id
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.password = password
        self.date = date
        self.v = v
    }
}

extension UserDefaults {
    func auth(forKey defaultName: String) -> UserData? {
        guard let data = data(forKey: defaultName) else { return nil }
        do {
            return try JSONDecoder().decode(UserData.self, from: data)
        } catch { print(error); return nil }
    }

    func set(_ value: UserData, forKey defaultName: String) {
        let data = try? JSONEncoder().encode(value)
        set(data, forKey: defaultName)
    }
}
