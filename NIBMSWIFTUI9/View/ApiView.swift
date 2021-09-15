//
//  ApiView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-05.
//

import SwiftUI

struct ApiView: View {
    
    @State var shoppingItems = [ShoppingItem]()
    @StateObject var itemApiService = ItemApiService()

    var body: some View {
        if(itemApiService.loading){
            ProgressView("Please wait...").progressViewStyle(CircularProgressViewStyle(tint: Color.purple)).scaleEffect(1, anchor: .center)
                
                .onAppear() {
                    itemApiService.loadData { (shoppingItems) in
                        self.shoppingItems = shoppingItems
                    }
                    
                }
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
            
            
        }else{
            NavigationView {
                List(shoppingItems, id: \.id) { ShoppingItem in
                    NavigationLink(destination: SingleItemView(singleItem: ShoppingItem)) {
                        HStack {
                            Image("burger")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:100, height:100)
                            VStack(alignment: .leading){
                                Text("\(ShoppingItem.productName)")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.leading)
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                Text("\(ShoppingItem.calories)")
                                    .font(.caption)
                                    .fontWeight(.light)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.leading)
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            }
                            Spacer()
                            Text("LKR. \(ShoppingItem.price)")
                                .fontWeight(.medium)
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        }
                    }

                }
                .onAppear() {
                    itemApiService.loadData { (shoppingItems) in
                        self.shoppingItems = shoppingItems
                    }
                }
            }
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
        }
        
    }
}

struct ApiView_Previews: PreviewProvider {
    static let cartViewModel = CartViewModel()

    static var previews: some View {
        ApiView().environmentObject(cartViewModel)
    }
}
