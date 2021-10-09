//
//  OrderHistoryViewModel.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-10-09.
//

import Foundation


class OrderHistoryViewModel: ObservableObject {
    @Published var orderHistoryModel = [OrderHistoryModel]()
    @Published var loading = true
    
    var orderHistoryDataService: OrderHistoryDataService = OrderHistoryApiService()
    
    
    init(orderHistoryDataService: OrderHistoryDataService = OrderHistoryApiService()) {
        self.orderHistoryDataService = orderHistoryDataService
    }
    
    func getOrderHistoryData() {
        orderHistoryDataService.loadOrderHistory { [weak self]orderHistoryDataServices in
            self?.orderHistoryModel = orderHistoryDataServices
            self?.loading = false
        }
    }
}
