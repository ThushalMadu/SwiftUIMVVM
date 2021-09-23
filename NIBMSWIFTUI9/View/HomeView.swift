//
//  HomeView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-17.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ApiView().tabItem {
                Image(systemName: "list.dash")
                Text("Home")
            }.tag("Home")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            CartView().tabItem {
                Image(systemName: "cart")
                Text("Cart")
            }.tag("Cart")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            ProfileView().tabItem {
                Image(systemName: "person.circle")
                Text("Profile")
            }.tag("Profile")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }.accentColor(.orange)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
