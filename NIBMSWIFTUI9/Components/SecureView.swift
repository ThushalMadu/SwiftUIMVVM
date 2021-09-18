//
//  SecureField.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-17.
//

import SwiftUI

struct SecureView: View {
    var title:String
    @Binding var text:String
    var keyboardType = UIKeyboardType.default
    
    var body: some View {
        VStack{
            SecureField(title, text: $text)
                .autocapitalization(.none)
                .keyboardType(keyboardType)
                .textFieldStyle(TextViewStyle())
        }
        .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 1, y: 3)
            )
    }
}

struct SecureView_Previews: PreviewProvider {
    @State static var name:String = ""

    static var previews: some View {
        SecureView(title: "qwew", text: $name)
    }
}
