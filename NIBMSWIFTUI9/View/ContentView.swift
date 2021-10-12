//
//  ContentView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-03.
//

import SwiftUI

struct ContentView: View {
    let email = UserDefaults.standard.string(forKey: "email")
    @StateObject private var cartViewModel = CartViewModel()
    @StateObject private var UIState = UIStateModel()
    
    var body: some View {
        if email == nil {
            NavigationView{
                SignUpView()
            }
        }else{
            NavigationView{
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
