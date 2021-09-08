//
//  TextView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-04.
//

import SwiftUI

struct TextView: View {
    
    var title:String
    @Binding var text:String
    var keyboardType = UIKeyboardType.default
    
    var body: some View {
        VStack{
            TextField(title, text: $text)
                .keyboardType(keyboardType)
                .textFieldStyle(TextViewStyle())
        }
        .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 1, y: 3)
            )

    // << here !!

        

    }
}

struct TextView_Previews: PreviewProvider {
    
    @State static var name:String = ""
    
    static var previews: some View {
        TextView(title: "qwew", text: $name)
    }
}
