//
//  SignInService.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-24.
//

import Foundation
import Alamofire

class SignInService: ObservableObject {
    let url = "https://aqueous-temple-31849.herokuapp.com/users/login"
    @Published var errorMessage = ""
    @Published var loading = false
    @Published var loggedIn = false
    
    func loginFun(email: String, password: String) {
        
        let parameters: Parameters=[
            "email":email,
            "password":password,
        ]
        
        loading = true
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON {
            response in
            switch (response.result) {
            case .success:
                UserDefaults.standard.set(email, forKey: "email")
                do {
                    let auth = try JSONDecoder().decode(UserData.self, from: response.data!)
                    print(auth)
                    UserDefaults.standard.set(auth, forKey: "Auth")
                } catch { print(error) }
                self.errorMessage = ""
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
