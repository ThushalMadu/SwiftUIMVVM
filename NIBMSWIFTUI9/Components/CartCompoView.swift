//
//  CartCompoView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-27.
//

import SwiftUI

struct CartCompoView: View {
    
    var function: () -> Void
    var productName:String
    var productPrice:String
    var productQty:String
    let imageUrl:URL
    
    
    var body: some View {
        HStack {
            AsyncImage(
                url: imageUrl,
                placeholder: {Text("Loading ...")}
            ).aspectRatio(contentMode: .fit)
            .frame(width:100, height:100)
            VStack(alignment: .leading){
                Text(productName)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Text("LKR. \(productPrice) x \(productQty)")
                    .fontWeight(.medium)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
            Spacer()
            Button(action: {
                self.function()
                //                cart.remove(item: Cart(productName: item.productName, price: item.price, qty: item.qty))
            }) {
                Image("rubbish")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:30, height:30)
            }
        }
    }
}

struct CartCompoView_Previews: PreviewProvider {
    static var previews: some View {
        CartCompoView(function: {print("cart")}, productName: "Burger", productPrice: "450", productQty: "2", imageUrl: URL(string: "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg")!)
    }
}
