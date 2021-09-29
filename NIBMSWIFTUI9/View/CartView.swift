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
                    TextTitle(title: CartStringData.lbl_cart, fontSize: 35, fontTitleWeight: .semibold)
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
                TextTitle(title: CartStringData.lbl_addEmptyItem, fontSize: 16, fontTitleWeight: .regular, fontColor: Color.black)
                    .padding(.top, 5.0)
                Spacer()
            }else{
                VStack{
                    List{
                        Section {
                            ForEach(cart.orderItems) { item in
                                CartCompoView(function: {
                                    cart.remove(item: Cart(productName: item.productName, price: item.price, qty: item.qty, imageUrl: item.imageUrl))
                                }, productName: "\(item.productName)", productPrice: String(item.price), productQty: String(item.qty), imageUrl: URL(string:item.imageUrl)!)
                            }
                        }
                    }
                    Spacer()
                    VStack{
                        HStack{
                            TextTitle(title: CartStringData.lbl_totalPayment, fontSize: 18, fontTitleWeight: .regular)
                                .padding(.leading, 30.0)
                            Spacer()
                            TextTitle(title: "Rs .\(String(cart.itemTotol))", fontSize: 18, fontTitleWeight: .regular,fontColor: Color.orange)
                                .padding(.trailing, 30.0)
                        }
                        .padding(.top)
                        Spacer()
                        NavigationLink(destination: OrderConfirmView(), isActive: $isActiveLink) {
                            ButtonView(title: CartStringData.btn_checkOut,
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
