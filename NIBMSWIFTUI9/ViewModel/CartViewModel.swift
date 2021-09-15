//
//  CartViewModel.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-10.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject {
    @Published var orderItems = [Cart]()
    
    func addToCart(item: Cart){
        orderItems.append(item)
        print(orderItems.count)
    }
}
