//
//  BannerModel.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-27.
//

import Foundation

class BannerModel: Codable {
    let id, itemName: String
    let image: String
    let price, qty: Int
    let items: [BannerItem]

    enum CodingKeys: String, CodingKey {
        case id = "item_id"
        case itemName = "item_name"
        case image, price, qty, items
    }

    init(id: String, itemName: String, image: String, price: Int, qty: Int, items: [BannerItem]) {
        self.id = id
        self.itemName = itemName
        self.image = image
        self.price = price
        self.qty = qty
        self.items = items
    }
}

class BannerItem: Codable {
    let id, itemName: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case itemName = "item_name"
    }

    init(id: String, itemName: String) {
        self.id = id
        self.itemName = itemName
    }
}

typealias Banner = [BannerModel]
