//
//  NIBMSWIFTUI9App.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-03.
//

import SwiftUI

@main
struct NIBMSWIFTUI9App: App {
    @StateObject private var order = CartViewModel()
    @StateObject private var UIState = UIStateModel()
    let email = UserDefaults.standard.string(forKey: "email")
    var body: some Scene {
        WindowGroup {
                        SignUpView().environmentObject(order).environmentObject(UIState)
//            TestView().environmentObject(UIState)

//            if email == nil {
//                SignUpView().environmentObject(order)
//            }else{
//                ApiView().environmentObject(order).environmentObject(UIState)
//            }
        }
    }
}
