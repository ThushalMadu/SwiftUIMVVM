//
//  ApiView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-05.
//

import SwiftUI

struct ApiView: View {

    @State var shoppingItems = [ShoppingItem]()
    @StateObject var homeViewModel = HomeViewModel()
    @State private var isActive = false
    @State private var email = UserDefaults.standard.string(forKey: "email")
    let auth = UserDefaults.standard.auth(forKey: "Auth")

    
    var body: some View {
        if(homeViewModel.loading){
            ProgressView(ApiViewStringData.pro_pleaseWait).progressViewStyle(CircularProgressViewStyle(tint: Color.purple)).scaleEffect(1, anchor: .center)
                .onAppear() {
                    homeViewModel.getHomeData()
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }else{
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        TextTitle(title: "Hey \(auth!.userExists.name)", fontSize: 16, fontTitleWeight: .regular)
                        TextTitle(title: ApiViewStringData.lbl_menu, fontSize: 40, fontTitleWeight: .semibold).padding(.top, 5.0)
                    }
                    Spacer()
                    Image(systemName: "bell")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:30, height:30)
                        .foregroundColor(.orange)
                }
                .padding([.top, .leading, .trailing], 30.0)
                HStack{
                    VStack(alignment: .leading){
                        TextTitle(title: ApiViewStringData.lbl_discount, fontSize: 18, fontTitleWeight: .medium)
                    }
                    Spacer()
                }
                .padding(.leading, 30.0)
                .padding(.top, 20.0)
                .padding(.bottom, 5.0)
                
                TestView()
                HStack{
                    VStack(alignment: .leading){
                        TextTitle(title: ApiViewStringData.lbl_aLLprodcts, fontSize: 18, fontTitleWeight: .medium)
                    }
                    Spacer()
                }
                .padding(.leading, 30.0)
                .padding(.top, 20.0)
                .padding(.bottom, 5.0)
                List(homeViewModel.shoppingItems, id: \.id) { ShoppingItem in
                    NavigationLink(destination: SingleItemView(singleItem: ShoppingItem)) {
                        MainMenuCompo( productName: ShoppingItem.productName, calories: ShoppingItem.calories, price: "LKR. \(ShoppingItem.price)",imageUrl: URL(string:ShoppingItem.imageUrl)!)
                    }
                }.onAppear() {
                    homeViewModel.getHomeData()
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
