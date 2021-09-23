//
//  ConfirmOrderView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-23.
//

import SwiftUI

struct ConfirmOrderView: View {
    
    @State private var isActiveLink = false
    
    var body: some View {
        VStack(spacing: 40.0){
            Image("confirmOrder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:UIScreen.main.bounds.height/3)
            VStack(spacing: 20.0){
                Text("Order Sucessfuly Placed")
                    .font(Font.custom("Georgia", size: 20))
                    .fontWeight(.medium)
                Text("Your order will recivece within this week")
                    .font(Font.custom("Georgia", size: 16))
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                Text("Keep in Touch with us")
                    .font(Font.custom("Georgia", size: 16))
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                Text("Order No : OR2634134")
                    .font(Font.custom("Georgia", size: 18))
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
            }
            NavigationLink(destination: HomeView(), isActive: $isActiveLink) {
                ButtonView(title: "Go To Home",
                           function: {
                            isActiveLink.toggle()
                           },
                           width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ConfirmOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmOrderView()
    }
}
