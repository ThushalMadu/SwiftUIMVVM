//
//  ThirdView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-03.
//

import SwiftUI

struct ThirdView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.green.opacity(0.4).ignoresSafeArea()
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss the toogle View")
            }
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
