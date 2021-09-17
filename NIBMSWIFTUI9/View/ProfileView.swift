//
//  ProfileView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-17.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("Your Profile")
                        .font(Font.custom("Georgia", size: 35))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .padding(.top, 5.0)
                }
                Spacer()
            }
            .padding([.top, .leading, .trailing], 30.0)
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
