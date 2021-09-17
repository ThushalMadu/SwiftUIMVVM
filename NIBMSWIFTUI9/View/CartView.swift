//
//  CartView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-16.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: CartViewModel
    
    var body: some View {
        List{
            Section {
                ForEach(cart.orderItems) { item in
                    HStack {
                        Image("burger")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:100, height:100)
                        VStack(alignment: .leading){
                            Text("\(item.productName)")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.leading)
                                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            Text("LKR. \(item.price) x \(item.qty)")
                                .fontWeight(.medium)
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        }
                        Spacer()
                        Button(action: {
                            cart.remove(item: Cart(productName: item.productName, price: item.price, qty: item.qty))
                        }) {
                            Image("rubbish")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:30, height:30)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Your Cart", displayMode: .large)
        .navigationBarBackButtonHidden(false)

    }
}
    struct CartView_Previews: PreviewProvider {
        static var previews: some View {
            CartView()
        }
    }
