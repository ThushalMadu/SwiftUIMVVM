//
//  ProfileView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-17.
//

import SwiftUI

struct ProfileView: View {
    @State private var email = UserDefaults.standard.string(forKey: "email")
    let auth = UserDefaults.standard.auth(forKey: "Auth")
    @State private var isActivePersonal:Bool = false
    @State private var isActiveLog:Bool = false
    @State private var isActiveOrderHistory:Bool = false
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    TextTitle(title: ProfileStringData.lbl_profile, fontSize: 35, fontTitleWeight: .semibold)
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
                    TextTitle(title: auth!.userExists.name, fontSize: 16, fontTitleWeight: .regular, fontColor: Color.black)
                        .padding(.top, 10.0)
                    TextTitle(title: email!, fontSize: 14, fontTitleWeight: .light, fontColor: Color.gray)
                        .padding(.top, 3.0)
                }
                .padding(.leading, 30.0)
                Spacer()
            }
            List {
                NavigationLink(destination: PersonalDataView(), isActive:$isActivePersonal) {
                    ProfileListCompo(imageTitle: "person.crop.circle.fill", function: {
                        isActivePersonal.toggle()
                    }, title: ProfileStringData.lbl_personal)
                }
                ProfileListCompo(imageTitle: "gear", function: {
                    print("click settings")
                }, title: ProfileStringData.lbl_settings ).padding(.top)
                NavigationLink(destination: OrderHistoryView(), isActive:$isActiveOrderHistory) {
                    ProfileListCompo(imageTitle: "note.text", function: {
                        isActiveOrderHistory.toggle()
                    }, title: ProfileStringData.lbl_orderhistory ).padding(.top)
                }
                ProfileListCompo(imageTitle: "message.circle.fill", function: {
                    print("click message")
                }, title: ProfileStringData.lbl_faqs).padding(.top)
                ProfileListCompo(imageTitle: "book.closed.fill", function: {
                    print("click book")
                }, title: ProfileStringData.lbl_handbook).padding(.top)
                ProfileListCompo(imageTitle: "person.3.fill", function: {
                    print("click person")
                }, title: ProfileStringData.lbl_community).padding(.top)
                NavigationLink(destination: SignUpView(), isActive:$isActiveLog) {
                    ProfileListCompo(imageTitle: "square.and.arrow.down", function: {
                    }, title: ProfileStringData.lbl_logOut).padding(.top)
                }
                
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
