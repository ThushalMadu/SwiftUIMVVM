//
//  Card.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-27.
//

import Foundation

struct Card: Decodable, Hashable, Identifiable {
    var id: Int
    var name: String = ""
    var imageUrl: String = ""
}
