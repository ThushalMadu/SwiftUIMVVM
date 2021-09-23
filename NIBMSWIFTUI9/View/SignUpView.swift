//
//  SignUpView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-08.
//

import SwiftUI
import Alamofire

struct SignUpView: View {
    
    @State private var email:String = ""
    @State private var name:String = ""
    @State private var phoneNumber:String = ""
    @State private var password:String = ""
    @State private var isActiveLink = false
    @State private var isActiveLinkSignIn = false
    @State private var loading = false
    @State private var errorMessage = ""
    
    let url = "https://aqueous-temple-31849.herokuapp.com/users/addUser"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    HStack{
                        Text("Welcome to High Burger 👋")
                            .font(Font.custom("Georgia", size: 30))
                            .fontWeight(.semibold)
                            .padding(.leading, 30.0)
                            .padding(.top, 20.0)
                        Spacer()
                    }
                    HStack{
                        Text("Hello i guess you are new around here Can start using this Online Store after create account or Sign in")
                            .font(Font.custom("Georgia", size: 14))
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                            .padding([.leading, .bottom], 30.0)
                            .padding(.top, 5.0)
                            .padding(.trailing, 40.0)
                        Spacer()
                    }
                    if(errorMessage == ""){
                        
                    }else{
                        Text(errorMessage)
                            .font(Font.custom("Georgia", size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(Color.red)
                            .padding(.vertical, 10.0)
                    }
                    VStack(alignment: .leading, spacing: 30){
                        TextView(title: "Name", text: $name)
                        TextView(title: "Email Address", text: $email)
                        TextView(title: "Phone Number", text: $phoneNumber)
                        SecureView(title: "Password", text: $password)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    
                    .padding([.top, .leading, .bottom], 30.0)
                    NavigationLink(destination: HomeView(), isActive: $isActiveLink) {
                        if(loading){
                            ProgressView("Please wait...").progressViewStyle(CircularProgressViewStyle(tint: Color.yellow)).scaleEffect(1, anchor: .center)
                        }else{
                            ButtonView(title: "Signup",
                                       function: {
                                        let parameters: Parameters=[
                                            "name":name,
                                            "email":email,
                                            "phone_number":phoneNumber,
                                            "password":password,
                                        ]
                                        loading = true
                                        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON {
                                            response in
                                            switch (response.result) {
                                            case .success:
                                                errorMessage = ""
                                                print(response)
                                                UserDefaults.standard.set(self.email, forKey: "email")
                                                isActiveLink.toggle()
                                                loading = false
                                                break
                                            case .failure(_):
                                                if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
                                                    print("Server Error: " + str)
                                                    errorMessage = str
                                                    isActiveLink.toggle()
                                                    loading = false
                                                }
                                            }
                                        }
                                       },
                                       width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
                        }
                    }
                    NavigationLink(destination: SignInView(), isActive:$isActiveLinkSignIn) {
                        Button(action: {
                            isActiveLinkSignIn.toggle()
                        }) {
                            Text("Already Have an account? Sign In")
                                .font(Font.custom("Georgia", size: 14))
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                                .padding(.top, 30.0)
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
