//
//  ProfileView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-17.
//

import SwiftUI

struct ProfileView: View {
    @State private var email = UserDefaults.standard.string(forKey: "email")

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
                    Text("Thushal Madhushankha")
                        .font(Font.custom("Georgia", size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                        .padding(.top, 10.0)
                    Text(email!)
                        .font(Font.custom("Georgia", size: 14))
                        .fontWeight(.light)
                        .foregroundColor(Color.gray)
                        .padding(.top, 3.0)
                }
                .padding(.leading, 30.0)
                Spacer()
            }
            List {
                HStack{
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:30, height:30)
                    VStack(alignment: .leading){
                        Text("Personal Data")
                            .font(Font.custom("Georgia", size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(Color.black)
                    }.padding(.leading, 30.0)
                    Spacer()

                    Image(systemName: "chevron.forward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:15, height:15)
                }
                HStack{
                    Image(systemName: "gear")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:30, height:30)
                    VStack(alignment: .leading){
                        Text("Settings")
                            .font(Font.custom("Georgia", size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(Color.black)
                    }.padding(.leading, 30.0)
                    Spacer()

                    Image(systemName: "chevron.forward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:15, height:15)
                }
                .padding(.top)
                HStack{
                    Image(systemName: "message.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:30, height:30)
                    VStack(alignment: .leading){
                        Text("FAQ's")
                            .font(Font.custom("Georgia", size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(Color.black)
                    }.padding(.leading, 30.0)
                    Spacer()

                    Image(systemName: "chevron.forward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:15, height:15)
                }
                .padding(.top)
                HStack{
                    Image(systemName: "book.closed.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:30, height:30)
                    VStack(alignment: .leading){
                        Text("Handbook")
                            .font(Font.custom("Georgia", size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(Color.black)
                    }.padding(.leading, 30.0)
                    Spacer()

                    Image(systemName: "chevron.forward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:15, height:15)
                }
                .padding(.top)
                HStack{
                    Image(systemName: "person.3.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:30, height:30)
                    VStack(alignment: .leading){
                        Text("Community")
                            .font(Font.custom("Georgia", size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(Color.black)
                    }.padding(.leading, 30.0)
                    Spacer()

                    Image(systemName: "chevron.forward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:15, height:15)
                }
                .padding(.top)
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
