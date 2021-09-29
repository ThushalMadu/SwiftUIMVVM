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
    @StateObject var signUpService = SignUpService()


    let url = "https://aqueous-temple-31849.herokuapp.com/users/addUser"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    HStack{
                        TextTitle(title:SignUpStringData.lbl_titleSignUp, fontSize: 30, fontTitleWeight: .semibold)
                            .padding(.leading, 30.0)
                            .padding(.top, 20.0)
                        Spacer()
                    }
                    HStack{
                        TextTitle(title: SignUpStringData.lbl_desSignUp, fontSize: 14, fontTitleWeight: .regular,fontColor: Color.gray)
                            .padding([.leading, .bottom], 30.0)
                            .padding(.top, 5.0)
                            .padding(.trailing, 40.0)
                        Spacer()
                    }
                    if(signUpService.errorMessage == ""){
                        
                    }else{
                        TextTitle(title: signUpService.errorMessage, fontSize: 16, fontTitleWeight: .regular, fontColor: Color.red)
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
                    NavigationLink(destination: HomeView(), isActive: $signUpService.loggedIn) {
                        if(signUpService.loading){
                            ProgressView(SignUpStringData.pro_pleaseWait).progressViewStyle(CircularProgressViewStyle(tint: Color.yellow)).scaleEffect(1, anchor: .center)
                        }else{
                            ButtonView(title: SignUpStringData.btn_signUp,
                                       function: {
                                        signUpService.signUpFun(name: name, email: email, phone_number: phoneNumber, password: password)
                                       },
                                       width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
                        }
                    }
                    NavigationLink(destination: SignInView(), isActive:$isActiveLinkSignIn) {
                        Button(action: {
                            isActiveLinkSignIn.toggle()
                            
                        }) {
                            TextTitle(title: SignUpStringData.btn_alrdBtn, fontSize: 14, fontTitleWeight: .regular, fontColor: Color.gray)
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
