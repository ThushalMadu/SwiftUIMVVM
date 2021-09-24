//
//  HomeView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-17.
//

import SwiftUI

struct HomeView: View {
    
    var homeStrings = HomeStringData()
    
    var body: some View {
        TabView {
            ApiView().tabItem {
                Image(systemName: "list.dash")
                Text(homeStrings.lbl_home)
            }.tag(homeStrings.lbl_home)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            CartView().tabItem {
                Image(systemName: "cart")
                Text(homeStrings.lbl_cart)
            }.tag(homeStrings.lbl_cart)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            ProfileView().tabItem {
                Image(systemName: "person.circle")
                Text(homeStrings.lbl_profile)
            }.tag(homeStrings.lbl_profile)
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
