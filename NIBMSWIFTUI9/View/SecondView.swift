//
//  SecondView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-03.
//

import SwiftUI

struct SecondView: View {
    
    @State var isPresented = false
    @Binding var name:String
    @Binding var age:String
    
    var body: some View {
        //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ZStack{
            Color.yellow.opacity(0.8)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Your Name is \(self.name)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Spacer()
                Text("Your Age is \(self.age)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Spacer()
                Button(action: {
                    isPresented.toggle()
                }) {
                    Text("Click Here View Main Menu")
                }.sheet(isPresented: $isPresented, content: {
                    ApiView()
                })
                Spacer()
            }
        }.navigationBarTitle("Second", displayMode: .inline)
        
    }
}

struct SecondView_Previews: PreviewProvider {
    @State static var name : String = ""
    @State static var age : String = ""
    
    static var previews: some View {
        SecondView(name: $name, age: $age)
    }
}
