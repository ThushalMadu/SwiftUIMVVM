//
//  FloatingButton.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-16.
//

import SwiftUI

struct FloatingButton: View {
    var body: some View {
        
        Button(action: {
            
        }) {
            Image(systemName: "cart.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.orange)
                .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
        }
        
        
        
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton()
    }
}
