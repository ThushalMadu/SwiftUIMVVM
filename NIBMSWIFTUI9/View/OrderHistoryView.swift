//
//  OrderHistoryView.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-10-09.
//

import SwiftUI

struct OrderHistoryView: View {
    
    @StateObject var orderhistorViewModel = OrderHistoryViewModel()
    @State var orderHistory = [OrderHistoryModel]()
    
    var body: some View {
        if(orderhistorViewModel.loading){
            ProgressView(ApiViewStringData.pro_pleaseWait).progressViewStyle(CircularProgressViewStyle(tint: Color.orange)).scaleEffect(1, anchor: .center)
                .onAppear() {
                    orderhistorViewModel.getOrderHistoryData()
                    
                }
        }else{
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        TextTitle(title: OrderHistoryStringData.lbl_orderHistoryHeader, fontSize: 35, fontTitleWeight: .semibold)
                    }
                    Spacer()
                }
                .padding([.leading, .trailing], 30.0)
                List(orderhistorViewModel.orderHistoryModel, id: \.id) { OrderHistoryModel in
                    HStack{
                        Spacer()
                        TextTitle(title: OrderHistoryModel.date, fontSize: 16, fontTitleWeight: .regular)
                        Spacer()
                        VStack{
                            ForEach(OrderHistoryModel.orderItem, id: \.id) { orderItem in
                                TextTitle(title: orderItem.itemName, fontSize: 16, fontTitleWeight: .regular)
                            }
                        }
                        Spacer()
                        TextTitle(title: "LKR. \(String(OrderHistoryModel.totalPrice))", fontSize: 16, fontTitleWeight: .regular)
                            .padding(.trailing, 20.0)
                    }
                }
            }.onAppear() {
                orderhistorViewModel.getOrderHistoryData()
            }
        }
    }
}

struct OrderHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryView()
    }
}
