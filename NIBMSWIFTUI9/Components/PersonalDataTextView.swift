//
//  PersonalDataTextView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-26.
//

import SwiftUI

struct PersonalDataTextView: View {
    
    var title:String
    var personalName:String
    
    var body: some View {
        HStack {
            Spacer()
            TextTitle(title: title, fontSize: 20, fontTitleWeight: .regular, fontColor: Color.gray)
            Spacer()
            VStack{
                TextTitle(title: personalName, fontSize: 18, fontTitleWeight: .regular)
                Rectangle().frame(height: 1)
                    .padding(.horizontal, 20).foregroundColor(Color.gray)
            }
            Spacer()
        }
    }
}

struct PersonalDataTextView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalDataTextView(title: "Name", personalName: "David")
    }
}
