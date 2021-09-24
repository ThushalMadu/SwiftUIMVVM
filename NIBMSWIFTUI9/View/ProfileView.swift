//
//  ProfileView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-17.
//

import SwiftUI

struct ProfileView: View {
    @State private var email = UserDefaults.standard.string(forKey: "email")
    var profileStringData = ProfileStringData()
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    TextTitle(title: profileStringData.lbl_profile, fontSize: 35, fontTitleWeight: .semibold)
                        .padding(.top, 5.0)
                }
                Spacer()
            }
            .padding([.top, .leading, .trailing], 30.0)
            HStack(alignment: .center){
                Image("mensprfile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:80, height:80)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 2)
                    .padding(.leading, 30.0)
                    .cornerRadius(10)
                VStack(alignment: .leading){
                    TextTitle(title: "Thushal Madhushankha", fontSize: 16, fontTitleWeight: .regular, fontColor: Color.black)
                        .padding(.top, 10.0)
                    TextTitle(title: email!, fontSize: 14, fontTitleWeight: .light, fontColor: Color.gray)
                        .padding(.top, 3.0)
                }
                .padding(.leading, 30.0)
                Spacer()
            }
            List {
                ProfileListCompo(imageTitle: "person.crop.circle.fill", title: profileStringData.lbl_personal)
                ProfileListCompo(imageTitle: "gear", title: profileStringData.lbl_settings).padding(.top)
                ProfileListCompo(imageTitle: "message.circle.fill", title: profileStringData.lbl_faqs).padding(.top)
                ProfileListCompo(imageTitle: "book.closed.fill", title: profileStringData.lbl_handbook).padding(.top)
                ProfileListCompo(imageTitle: "person.3.fill", title: profileStringData.lbl_community).padding(.top)
            }
            .padding(.top, 10.0)
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
