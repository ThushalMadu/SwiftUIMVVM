//
//  OrderConfirmView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-23.
//

import SwiftUI

struct OrderConfirmView: View {
    
    @State var isMarked = false
    @EnvironmentObject var cart: CartViewModel
    @State private var isActiveLink = false
    
    var body: some View {
        VStack {
            VStack{
                Text("Order Confirm")
                    .font(Font.custom("Georgia", size: 26))
                    .fontWeight(.regular)
                    .padding(.top, 10.0)
            }
            HStack{
                Text("Shipping to")
                    .font(Font.custom("Georgia", size: 20))
                    .fontWeight(.regular)
                    .padding(.top, 20.0)
                    
                    .padding(.leading, 30.0)
                Spacer()
            }
            HStack{
                VStack(alignment: .leading){
                    Text("Home")
                        .font(Font.custom("Georgia", size: 20))
                        .fontWeight(.medium)
                        .padding(.top, 10.0)
                        .padding(.leading, 30.0)
                    Text("No 189, Prekum Pedase kaduruwela")
                        .font(Font.custom("Georgia", size: 16))
                        .fontWeight(.light)
                        .foregroundColor(Color.gray)
                        .padding(.top, 3.0)
                        .padding(.leading, 30.0)
                    Text("Polonnaruwa, Sri Lanka")
                        .font(Font.custom("Georgia", size: 16))
                        .fontWeight(.light)
                        .foregroundColor(Color.gray)
                        .padding(.top, 3.0)
                        .padding(.leading, 30.0)
                    Text("Postal Code 51000")
                        .font(Font.custom("Georgia", size: 16))
                        .fontWeight(.light)
                        .foregroundColor(Color.gray)
                        .padding(.top, 3.0)
                        .padding(.leading, 30.0)
                }
                Spacer()
            }
            HStack{
                Text("Payment Type")
                    .font(Font.custom("Georgia", size: 20))
                    .fontWeight(.regular)
                    .padding(.top, 20.0)
                    
                    .padding(.leading, 30.0)
                Spacer()
            }
            Button(action:{
                isMarked.toggle()
            }) {
                HStack(alignment: .center){
                    Spacer()
                    Image("visa")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:80, height:75)
                    Spacer()
                    VStack(alignment: .leading){
                        Text("Debit Card")
                            .font(Font.custom("Georgia", size: 16))
                            .fontWeight(.light)
                            .foregroundColor(Color.black)
                            .padding(.top, 10.0)
                        Text("HNB Bank")
                            .font(Font.custom("Georgia", size: 16))
                            .fontWeight(.light)
                            .foregroundColor(Color.gray)
                            .padding(.top, 3.0)
                        Text("**** **** **** 4242")
                            .font(Font.custom("Georgia", size: 16))
                            .fontWeight(.light)
                            .foregroundColor(Color.black)
                            .padding(.top, 3.0)
                    }
                    Spacer()
                    HStack(alignment: .center) {
                        Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                            .clipShape(Circle())
                            .foregroundColor(Color.blue)
                    }.foregroundColor(Color.blue)
                    Spacer()
                }
            }
            HStack{
                Text("Total Payment")
                    .font(Font.custom("Georgia", size: 20))
                    .fontWeight(.regular)
                    .padding(.leading, 30.0)
                Spacer()
                Text("Rs .\(String(cart.itemTotol))")
                    //                Text("Rs .4300")
                    .font(Font.custom("Georgia", size: 18))
                    .fontWeight(.regular)
                    .foregroundColor(Color.orange)
                    .padding(.trailing, 30.0)
            }.padding(.top, 30.0)
            NavigationLink(destination: ConfirmOrderView(), isActive: $isActiveLink) {
                ButtonView(title: "Confirm Your Order",
                           function: {
                            isActiveLink.toggle()
                           },
                           width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
                    .padding(.top, 50.0)
            }
            Spacer()
        }
    }
}

struct OrderConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        OrderConfirmView()
    }
}
