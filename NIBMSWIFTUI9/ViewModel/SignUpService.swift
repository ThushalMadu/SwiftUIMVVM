//
//  SignUpService.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-08.
//

import Foundation
import Alamofire

class SignUpService:ObservableObject {
    let parameters = [
        "username": "foo",
        "password": "123456"
    ]
//    let userModel: Parameters = [UserModel]
    
    
    let url = "https://aqueous-temple-31849.herokuapp.com/users/addUser"
    func sendPostMethod() {
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON {
            response in
            switch (response.result) {
            case .success:
                print(response)
                break
            case .failure:
                print(Error.self)
            }
        }
    }
    
}
