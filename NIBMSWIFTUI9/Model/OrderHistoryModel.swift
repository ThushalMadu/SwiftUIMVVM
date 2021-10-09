//
//  OrderHistoryModel.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-10-09.
//

import Foundation

// MARK: - OrderHistoryModelElement
class OrderHistoryModel: Codable {
    let totalPrice: Int
    let id: String
    let orderItem: [OrderItem]
    let categeroy, adressNo1, adressNo2, date: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case totalPrice = "total_price"
        case id = "_id"
        case orderItem = "OrderItem"
        case categeroy
        case adressNo1 = "adress_No1"
        case adressNo2 = "adress_No2"
        case date
        case v = "__v"
    }

    init(totalPrice: Int, id: String, orderItem: [OrderItem], categeroy: String, adressNo1: String, adressNo2: String, date: String, v: Int) {
        self.totalPrice = totalPrice
        self.id = id
        self.orderItem = orderItem
        self.categeroy = categeroy
        self.adressNo1 = adressNo1
        self.adressNo2 = adressNo2
        self.date = date
        self.v = v
    }
}

// MARK: - OrderItem
class OrderItem: Codable {
    let id, itemName: String
    let qty, price: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case itemName = "item_name"
        case qty, price
    }

    init(id: String, itemName: String, qty: Int, price: Int) {
        self.id = id
        self.itemName = itemName
        self.qty = qty
        self.price = price
    }
}

