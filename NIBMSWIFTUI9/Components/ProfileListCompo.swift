//
//  ProfileListCompo.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-24.
//

import SwiftUI

struct ProfileListCompo: View {
    
    var imageTitle:String
    var title:String
    
    var body: some View {
        HStack{
            Image(systemName: imageTitle)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:30, height:30)
            VStack(alignment: .leading){
                TextTitle(title: title, fontSize: 16, fontTitleWeight: .regular)
            }.padding(.leading, 30.0)
            Spacer()
            Image(systemName: "chevron.forward")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:15, height:15)
        }
    }
}

struct ProfileListCompo_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListCompo(imageTitle: "circle.hexagonpath.fill", title: "Personal Data")
    }
}
