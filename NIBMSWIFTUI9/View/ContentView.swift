//
//  ContentView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-03.
//

import SwiftUI

struct ContentView: View {
    
    @State var isActiveLink = false
    @State var name:String=""
    @State var age:String=""
    
    var body: some View {
        NavigationView {
            VStack{
                Image("iosimage")
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    .shadow(radius:7)
                  
                Spacer()
                Text("Hello, Thushal!")
                    .padding()
                Spacer()
                TextView(title: "Enter Your Name", text: $name)
                TextView(title: "Enter Your Age", text: $age,keyboardType: .numberPad)
                Spacer()
                if(name=="" || age==""){
                    Text("Enter Your Details Here")
                        .fontWeight(.medium)
                        .foregroundColor(Color.black)
                        .padding()
                }else{
                    NavigationLink(destination: SecondView(name: self.$name, age: self.$age), isActive: $isActiveLink) {
                        Button(action: {
                            isActiveLink = true
                        }) {
                            Text("Click Here for Second View")
                                .padding()
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
