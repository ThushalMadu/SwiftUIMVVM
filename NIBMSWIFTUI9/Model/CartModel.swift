//
//  CartModel.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-10.
//

import Foundation


struct Cart :Codable, Identifiable {
    let id = UUID()
    var productName: String
    var price: Int
    var qty: Int
    var imageUrl: String
}
