//
//  SignUpView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-08.
//

import SwiftUI
import Alamofire

struct SignUpView: View {
    
    @State var email:String = ""
    @State var name:String = ""
    @State var phoneNumber:String = ""
    @State var password:String = ""
    @State var isActiveLink = false
    @State var loading = false
    
    let url = "https://aqueous-temple-31849.herokuapp.com/users/addUser"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    Spacer()
                    HStack{
                        Text("Hello Thushal")
                            .font(Font.custom("Georgia", size: 30))
                            .fontWeight(.semibold)
                            .padding(.leading, 30.0)
                            .padding(.top, 10.0)
                        Spacer()
                    }
                    HStack{
                        Text("Welcome")
                            .font(Font.custom("Georgia", size: 30))
                            .fontWeight(.semibold)
                            .padding(.leading, 30.0)
                            .padding(.top, 5.0)
                        Spacer()
                    }
                    HStack{
                        Text("Back")
                            .font(Font.custom("Georgia", size: 30))
                            .fontWeight(.semibold)
                            .padding(.leading, 30.0)
                            .padding(.top, 5.0)
                        Spacer()
                    }
                    Image("shoppingbro")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:UIScreen.main.bounds.height/3.5)
                        .opacity(0.8)
                    VStack(alignment: .leading, spacing: 30){
                        TextView(title: "Name", text: $name)
                        TextView(title: "Email Address", text: $email)
                        TextView(title: "Phone Number", text: $phoneNumber)
                        SecureView(title: "Password", text: $password)
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    
                    .padding([.leading, .bottom], 30.0)
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
                                                print(response)
                                                UserDefaults.standard.set(self.name, forKey: "name")
                                                loading = false
                                                isActiveLink.toggle()
                                                break
                                            case .failure(let error):
                                                isActiveLink.toggle()
                                                print(error)
                                                loading = false
                                            }
                                        }
                                       },
                                       width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
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
