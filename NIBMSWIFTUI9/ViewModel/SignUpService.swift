//
//  SignUpService.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-08.
//

import Foundation
import Alamofire

protocol SignUpDataService {
    func signUpFun(name: String, email: String, phone_number: String, password: String) 
}

class SignUpService:ObservableObject {
    
    let url = "https://aqueous-temple-31849.herokuapp.com/users/addUser"
    @Published var errorMessage = ""
    @Published var loading = false
    @Published var loggedIn = false
    
    func signUpFun(name: String, email: String, phone_number: String, password: String) {
        let parameters: Parameters=[
            "name":name,
            "email":email,
            "phone_number":phone_number,
            "password":password,
        ]
        loading = true
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON {
            response in
            switch (response.result) {
            case .success:
                UserDefaults.standard.set(email, forKey: "email")
                self.errorMessage = ""
                print(response)
                self.loggedIn = true
                self.loading = false
                break
            case .failure:
                if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
                    print("Server Error: " + str)
                    self.errorMessage = str
                    self.loading = false
                    self.loggedIn = false
                }
                print(Error.self)
            }
        }
    }
}
