//
//  PersonalDataView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-26.
//

import SwiftUI

struct PersonalDataView: View {
    
    let auth = UserDefaults.standard.auth(forKey: "Auth")
    
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading){
                    TextTitle(title: PersonalDataString.lbl_account, fontSize: 35, fontTitleWeight: .semibold)
                }
                Spacer()
            }
            .padding([.leading, .trailing], 30.0)
            VStack(alignment: .center, spacing: 40) {
                PersonalDataTextView(title: "Name", personalName: auth!.userExists.name)
                PersonalDataTextView(title: "Email", personalName: auth!.userExists.email)
                PersonalDataTextView(title: "Phone Number", personalName: String(auth!.userExists.phoneNumber))
            }.padding([.top, .leading], 30.0)
            .padding(.trailing, 10.0)
            Spacer()
        }
    }
}

struct PersonalDataView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalDataView()
    }
}
