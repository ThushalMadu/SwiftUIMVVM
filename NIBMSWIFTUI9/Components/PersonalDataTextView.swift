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
            TextTitle(title: title, fontSize: 14, fontTitleWeight: .regular, fontColor: Color.gray)
            Spacer()
            VStack(alignment: .center){
                TextTitle(title: personalName, fontSize: 16, fontTitleWeight: .regular)
                Rectangle().frame(width:UIScreen.main.bounds.width/1.7, height: 1)
                    .padding(.horizontal, 20).foregroundColor(Color.gray)
            }
        }
    }
}

struct PersonalDataTextView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalDataTextView(title: "Name", personalName: "David")
    }
}
