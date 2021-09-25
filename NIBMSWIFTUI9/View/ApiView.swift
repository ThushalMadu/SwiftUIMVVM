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
    @State private var email = UserDefaults.standard.string(forKey: "email")
    let auth = UserDefaults.standard.auth(forKey: "Auth")
    
    var apiStringsData = ApiViewStringData()
    
    var body: some View {
        if(itemApiService.loading){
            ProgressView(apiStringsData.pro_pleaseWait).progressViewStyle(CircularProgressViewStyle(tint: Color.purple)).scaleEffect(1, anchor: .center)
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
                        TextTitle(title: "Hey \(auth!.userExists.name)", fontSize: 16, fontTitleWeight: .regular)
                        TextTitle(title: apiStringsData.lbl_menu, fontSize: 40, fontTitleWeight: .semibold).padding(.top, 5.0)
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
                        MainMenuCompo(imageTitle: "burger", productName: ShoppingItem.productName, calories: ShoppingItem.calories, price: "LKR. \(ShoppingItem.price)")
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
