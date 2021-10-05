//
//  HomeView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-17.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var cart: CartViewModel
    @State private var badgeCount: Int = 1
    private var badgePosition: CGFloat = 2
    private var tabsCount: CGFloat = 3
    @StateObject private var UIState = UIStateModel()

    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                TabView {
                    ApiView().tabItem {
                        Image(systemName: "list.dash")
                        Text(HomeStringData.lbl_home)
                    }.tag(HomeStringData.lbl_home)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    CartView().tabItem {
                        Image(systemName: "cart")
                        Text(HomeStringData.lbl_cart)
                    }.tag(HomeStringData.lbl_cart)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    ProfileView().tabItem {
                        Image(systemName: "person.circle")
                        Text(HomeStringData.lbl_profile)
                    }.tag(HomeStringData.lbl_profile)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                }.accentColor(.orange)
                ZStack {
                    Circle()
                        .foregroundColor(.orange)
                    Text("\(self.cart.orderItems.count)")
                        .foregroundColor(.white)
                        .font(Font.system(size: 12))
                }
                .frame(width: 20, height: 20)
                .offset(x: ( ( 2 * self.badgePosition) - 0.95 ) * ( geometry.size.width / ( 2 * self.tabsCount ) ) + 2, y: -25)
                .opacity(self.cart.orderItems.count == 0 ? 0 : 1.0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
