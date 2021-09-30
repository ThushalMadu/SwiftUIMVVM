//
//  TestView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-27.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var UIState: UIStateModel
    
    var body: some View {
        let spacing: CGFloat = 16
        let widthOfHiddenCards: CGFloat = 32 /// UIScreen.main.bounds.width - 10
        let cardHeight: CGFloat = 150
        
        let items = [
            Card(id: 0, name: "Monday Discount Plates", imageUrl: "https://res.cloudinary.com/thushal/image/upload/v1624047156/BannerImages/banner5_bunuru.jpg"),
            Card(id: 1, name: "Tuesday Discount Plates", imageUrl: "https://res.cloudinary.com/thushal/image/upload/v1624047153/BannerImages/banner2_xdnt5p.jpg"),
            Card(id: 2, name: "Wedenesday Discount Plates", imageUrl: "https://res.cloudinary.com/thushal/image/upload/v1624047153/BannerImages/banner1_evb1k5.jpg"),
            Card(id: 3, name: "Thursday Discount Plates", imageUrl: "https://res.cloudinary.com/thushal/image/upload/v1624047153/BannerImages/banner4_vpvpvz.jpg")
        ]
        
        return Canvas {
            /// TODO: find a way to avoid passing same arguments to Carousel and Item
            Carousel(
                numberOfItems: CGFloat(items.count),
                spacing: spacing,
                widthOfHiddenCards: widthOfHiddenCards
            ) {
                ForEach(items, id: \.self.id) { item in
                    Item(
                        _id: Int(item.id),
                        spacing: spacing,
                        widthOfHiddenCards: widthOfHiddenCards,
                        cardHeight: cardHeight
                    ) {
                        ZStack(alignment: .center) {
                            AsyncImage(
                                url: URL(string:item.imageUrl)!,
                                placeholder: {Text("Loading ...")}
                            ).scaledToFill()
                            .opacity(0.5)
//                            .frame(width: .infinity)
                            Text(item.name)
                                .font(Font.custom("Georgia", size: 30))
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .foregroundColor(Color.white)
                    .background(Color.orange)
                    .cornerRadius(8)
                    .shadow(color: Color.gray, radius: 4, x: 0, y: 4)
                    .transition(AnyTransition.slide)
                    .animation(.spring())
                }
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
