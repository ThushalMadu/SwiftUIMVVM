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
    @State private var isActive = false
    @State private var name = UserDefaults.standard.string(forKey: "name")
    
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
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("Hey Thushal")
                            .font(Font.custom("Georgia", size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(Color.black)
                        Text("Menu")
                            .font(Font.custom("Georgia", size: 40))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .padding(.top, 5.0)
                    }
                    Spacer()
                    Image(systemName: "bell")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:30, height:30)
                        .foregroundColor(.orange)
                }
                .padding([.top, .leading, .trailing], 30.0)
                    
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
                }.onAppear() {
                    itemApiService.loadData { (shoppingItems) in
                        self.shoppingItems = shoppingItems
                    }
                }
            }
            
            
        }
    }
}

struct ApiView_Previews: PreviewProvider {
    static let cartViewModel = CartViewModel()
    
    static var previews: some View {
        ApiView().environmentObject(cartViewModel)
    }
}
