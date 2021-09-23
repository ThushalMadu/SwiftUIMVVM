//
//  SignInView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-21.
//

import SwiftUI
import Alamofire
struct SignInView: View {
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var errorMessageLogin = ""
    @State private var isActiveLinkLogin = false
    @State private var isActiveLinkSignUp = false
    @State private var loading = false
    @StateObject var signInService = SignInService()
    
    let url = "https://aqueous-temple-31849.herokuapp.com/users/login"
    
    var body: some View {
        ScrollView {
            VStack{
                Spacer()
                HStack{
                    Text("Let's sign you in")
                        .font(Font.custom("Georgia", size: 30))
                        .fontWeight(.semibold)
                        .padding(.leading, 30.0)
                        .padding(.top, 20.0)
                    Spacer()
                }
                HStack{
                    Text("Welcome back you have been missed!")
                        .font(Font.custom("Georgia", size: 14))
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                        .padding([.leading], 30.0)
                        .padding(.top, 5.0)
                    Spacer()
                }
                HStack{
                    Text("you have been missed!")
                        .font(Font.custom("Georgia", size: 14))
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                        .padding([.leading, .bottom], 30.0)
                        .padding(.top, 5.0)
                    Spacer()
                }
                if(signInService.errorMessage == ""){
                    
                }else{
                    Text(signInService.errorMessage)
                        .font(Font.custom("Georgia", size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(Color.red)
                        .padding(.vertical, 10.0)
                }
                VStack(alignment: .leading, spacing: 30){
                    TextView(title: "Email Address", text: $email)
                    SecureView(title: "Password", text: $password)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                
                .padding([.top, .leading, .bottom], 30.0)
                NavigationLink(destination: HomeView(), isActive:$signInService.loggedIn) {
                    if(signInService.loading){
                        ProgressView("Please wait...").progressViewStyle(CircularProgressViewStyle(tint: Color.yellow)).scaleEffect(1, anchor: .center)
                    }else{
                        ButtonView(title: "Sign In",
                                   function: {
                                    signInService.loginFun(email: email, password: password)
                                   },
                                   width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
                    }
                }
                NavigationLink(destination: SignUpView()
                                .navigationBarHidden(true)
                                .navigationBarBackButtonHidden(true), isActive:$isActiveLinkSignUp) {
                    Button(action: {
                        isActiveLinkSignUp.toggle()
                        
                    }) {
                        Text("Don't have an account? Sign Up")
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

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
