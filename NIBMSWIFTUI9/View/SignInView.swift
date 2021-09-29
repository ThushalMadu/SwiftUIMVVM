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
                    TextTitle(title: SignInStringData.lbl_titleSignIn, fontSize: 30, fontTitleWeight: .semibold)
                        .padding(.leading, 30.0)
                        .padding(.top, 20.0)
                    Spacer()
                }
                HStack{
                    TextTitle(title: SignInStringData.lbl_desSignIn, fontSize: 14, fontTitleWeight: .regular)
                        .padding([.leading], 30.0)
                        .padding(.top, 5.0)
                    Spacer()
                }
                HStack{
                    TextTitle(title: SignInStringData.lbl_containSignIn, fontSize: 14, fontTitleWeight: .regular)
                        .padding([.leading, .bottom], 30.0)
                        .padding(.top, 5.0)
                    Spacer()
                }
                if(signInService.errorMessage == ""){
                    
                }else{
                    TextTitle(title: signInService.errorMessage, fontSize: 16, fontTitleWeight: .regular, fontColor: Color.red)
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
                        ProgressView(SignInStringData.pro_progressView).progressViewStyle(CircularProgressViewStyle(tint: Color.yellow)).scaleEffect(1, anchor: .center)
                    }else{
                        ButtonView(title: SignInStringData.btn_signIn,
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
                        TextTitle(title: SignInStringData.lbl_dontHaveacnt, fontSize: 14, fontTitleWeight: .regular, fontColor: Color.gray)
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
