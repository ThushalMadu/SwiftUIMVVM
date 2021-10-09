//
//  OrderHistoryApiService.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-10-09.
//

import Foundation

protocol OrderHistoryDataService {
    func loadOrderHistory(completion:@escaping ([OrderHistoryModel]) -> ())
}

class OrderHistoryApiService: OrderHistoryDataService {
        
    func loadOrderHistory(completion:@escaping ([OrderHistoryModel]) -> ()) {
        
        guard let url = URL(string: "https://aqueous-temple-31849.herokuapp.com/orders/showAllOrders") else {
            print("Invalid url...")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            let orderHistoryItems = try! JSONDecoder().decode([OrderHistoryModel].self, from: data!)
            print(orderHistoryItems)
            //            In swiftui two main process  dispatch with main and dispatch with global( BackGround Thread )
            //            we can use global(background) and inside of that background can use MAIN thread
            DispatchQueue.main.async {   //UI UPDATES ALWAYS SHOULD HAPPEN THE MAIN THREAD
                completion(orderHistoryItems)
            }
        }.resume()
    }
}
