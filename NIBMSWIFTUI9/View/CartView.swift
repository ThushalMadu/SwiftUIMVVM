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
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("Your Cart")
                        .font(Font.custom("Georgia", size: 35))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .padding(.top, 5.0)
                }
                Spacer()
            }
            .padding([.top, .leading, .trailing], 30.0)
            if(cart.orderItems.count == 0){
                Spacer()
                Image("emptyPana")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:UIScreen.main.bounds.height/3.5)
                    .opacity(0.8)
                Text("Add Item to Cart")
                    .font(Font.custom("Georgia", size: 16))
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                    .padding(.top, 10.0)
                Spacer()
            }else{
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
            }
        }
        
    }
}
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
