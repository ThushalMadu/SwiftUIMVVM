//
//  ShoppingItem.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-05.
//

import Foundation

struct ShoppingItem:Codable, Identifiable {
    let id = UUID()
    var productName: String
    var calories: String
    var price: Int
    var description: String
    var imageUrl: String
}
