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
    @Published var itemTotol = 0

    func addToCart(item: Cart){
        if let index = orderItems.firstIndex(where: {$0.productName == item.productName}){
            orderItems[index].qty = orderItems[index].qty + item.qty
            itemTotol = (item.price*item.qty) + itemTotol
        }else{
            orderItems.append(item)
            itemTotol = (item.price*item.qty) + itemTotol
            print(orderItems.count)
        }
    }
    func remove(item: Cart) {
        if let index = orderItems.firstIndex(where: {$0.productName == item.productName}){
            orderItems.remove(at: index)
            itemTotol = itemTotol - (item.price*item.qty)
        }
    }
    
    func clearCart() {
        orderItems.removeAll()
        itemTotol = 0
    }
    
}
