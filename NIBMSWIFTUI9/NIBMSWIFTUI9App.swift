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

    var body: some Scene {
        WindowGroup {
            SignUpView().environmentObject(order)
        }
    }
}
