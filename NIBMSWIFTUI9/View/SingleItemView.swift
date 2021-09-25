//
//  SingleItemView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-06.
//

import SwiftUI

struct SingleItemView: View {
    
    var singleItem: ShoppingItem
    @State var quantity = 1
    @EnvironmentObject var cartViewModel: CartViewModel
    var singleItemStrings = SingleItemStringData()
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            VStack{
                Image("burger")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:UIScreen.main.bounds.width/1.5, height:UIScreen.main.bounds.height/4)
                Spacer()
                VStack(alignment: .leading){
                    HStack{
                        Text("\(singleItem.productName)")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.leading, 30.0)
                        Spacer()
                    }
                    HStack{
                        Text("\(singleItem.calories)")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                            .padding(.top, 5.0)
                            .padding(.leading, 30.0)
                        Spacer()
                    }
                    HStack{
                        Text("LKR. \(singleItem.price).00")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top, 10.0)
                            .padding(.leading, 30.0)
                        Spacer()
                        ButtonView(title: "+",
                                   function: {
                                    quantity += 1
                                   },
                                   width:UIScreen.main.bounds.width/30,height: UIScreen.main.bounds.height/120)
                        Text(String(quantity))
                            .font(.title3)
                            .fontWeight(.medium)
                            .padding(.horizontal, 10.0)
                        ButtonView(title: "-",
                                   function: {
                                    if(quantity>1){
                                        quantity -= 1
                                        
                                    }
                                   },
                                   width:UIScreen.main.bounds.width/30,height: UIScreen.main.bounds.height/120)
                            .padding(.trailing, 30.0)
                    }
                    HStack{
                        Text(singleItemStrings.lbl_productDescription)
                            .font(.title3)
                            .fontWeight(.medium)
                            .padding(.top, 10.0)
                            .padding(.leading, 30.0)
                        Spacer()
                    }
                    HStack{
                        Text("\(singleItem.description)")
                            .font(.footnote)
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                            .padding(.top, 5.0)
                            .padding(.leading, 30.0)
                        Spacer()
                    }
                }
                .frame(maxWidth:.infinity)
                
                Spacer()
                ButtonView(title: singleItemStrings.btn_addToCart,
                           function: {
                            self.cartViewModel.addToCart(item: Cart(productName: self.singleItem.productName, price: self.singleItem.price, qty: self.quantity))
                           },
                           width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
            }
            
        }
        
        //        .navigationBarBackButtonHidden(true)
        //        .navigationBarHidden(true)
    }
}

struct SingleItemView_Previews: PreviewProvider {
    @StateObject static var singleitm = ItemApiService()
    static let cartViewModel = CartViewModel()
    
    static var previews: some View {
        
        SingleItemView(singleItem: singleitm.shoppingItems[0]).environmentObject(cartViewModel)
    }
}
