//
//  ConfirmOrderView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-23.
//

import SwiftUI

struct ConfirmOrderView: View {
    
    @State private var isActiveLink = false
    @EnvironmentObject var cart: CartViewModel
    let randomInt = Int.random(in: 1..<1000)
    
    var body: some View {
        VStack(spacing: 40.0){
            Image("confirmOrder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:UIScreen.main.bounds.height/3)
            VStack(spacing: 20.0){
                TextTitle(title: ConfirmOrderStringData.lbl_confirmTitle, fontSize: 20, fontTitleWeight: .medium, fontColor: Color.black)
                TextTitle(title: ConfirmOrderStringData.lbl_orderRecieve, fontSize: 16, fontTitleWeight: .regular, fontColor: Color.black)
                TextTitle(title: ConfirmOrderStringData.lbl_keepInTouch, fontSize: 16, fontTitleWeight: .regular, fontColor: Color.black)
                TextTitle(title: "Order No : OR\(String(randomInt))", fontSize: 18, fontTitleWeight: .regular, fontColor: Color.black)
            }
            NavigationLink(destination: HomeView(), isActive: $isActiveLink) {
                ButtonView(title: ConfirmOrderStringData.btn_goHome,
                           function: {
                            cart.orderItems.removeAll()
                            cart.itemTotol = 0
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
