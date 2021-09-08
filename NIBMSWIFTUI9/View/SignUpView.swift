//
//  SignUpView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-08.
//

import SwiftUI

struct SignUpView: View {
    
    @State var email:String = ""
    @State var name:String = ""
    @State var phoneNumber:String = ""
    @State var password:String = ""
    
    var body: some View {
        ScrollView {

        VStack{
            Spacer()
            HStack{
                Text("Hello Thushal")
                    .font(Font.custom("Avenir", size: 30))
                    .fontWeight(.semibold)
                    .padding(.leading, 30.0)
                Spacer()
            }
            HStack{
                Text("Welcome")
                    .font(Font.custom("Avenir", size: 30))
                    .fontWeight(.semibold)
                    .padding(.leading, 30.0)
                Spacer()
            }
            HStack{
                Text("Back")
                    .font(Font.custom("Avenir", size: 30))
                    .fontWeight(.semibold)
                    .padding(.leading, 30.0)
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
                TextView(title: "Password", text: $password)
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            
            .padding([.leading, .bottom], 30.0)
            
            ButtonView(title: "Signup",
                       function: {
                        print("This is Passing Function")
                       },
                       width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
          

        }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
