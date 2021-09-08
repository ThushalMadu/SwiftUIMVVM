//
//  ButtonViewStyle.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-07.
//            .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/45,)


import SwiftUI

struct ButtonViewStyle: ButtonStyle {
    var backgroundColor1 = Color.orange
    var backgroundColor2 = Color.white
    var definWidth:CGFloat = 300
    var definHeight:CGFloat = 40

    @Environment(\.isEnabled) private var isEnabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: definWidth, height: definHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding()
            .background(isEnabled ? backgroundColor1 : backgroundColor1.opacity(0.5))
            .clipShape(Capsule())
            .foregroundColor(isEnabled ? backgroundColor2 : backgroundColor2.opacity(0.5))
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
    }
}
