//
//  CartView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-16.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: CartViewModel
    @State private var isActiveLink = false

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
                    .padding(.top, 5.0)
                Spacer()
            }else{
                VStack{
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
                    Spacer()
                    VStack{
                        HStack{
                            Text("Total Payment")
                                .font(Font.custom("Georgia", size: 18))
                                .fontWeight(.regular)
                                .foregroundColor(Color.black)
                                .padding(.leading, 30.0)
                            Spacer()
                            Text("Rs .\(String(cart.itemTotol))")
                                .font(Font.custom("Georgia", size: 18))
                                .fontWeight(.regular)
                                .foregroundColor(Color.orange)
                                .padding(.trailing, 30.0)
                        }
                        .padding(.top)
                        Spacer()
                        NavigationLink(destination: OrderConfirmView(), isActive: $isActiveLink) {
                            ButtonView(title: "Checkout",
                                       function: {
                                        isActiveLink.toggle()
                                       },
                                       width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
                        }
                        Spacer()
                    }.frame(height: 150)
                    .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 1, y: 3)
                        )

                    
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
