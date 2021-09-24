//
//  MainMenuCompo.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-24.
//

import SwiftUI

struct MainMenuCompo: View {
    var imageTitle:String
    var productName:String
    var calories:String
    var price:String
    
    var body: some View {
        HStack {
            Image("burger")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:100, height:100)
            VStack(alignment: .leading){
                Text(productName)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Text(calories)
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
            Spacer()
            Text(price)
                .fontWeight(.medium)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding(.all)
        }
    }
}

struct MainMenuCompo_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuCompo(imageTitle: "burger", productName: "Burger", calories: "180 cal", price: "500")
    }
}
