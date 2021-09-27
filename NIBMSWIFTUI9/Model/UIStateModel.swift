//
//  UIStateModel.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-27.
//

import Foundation

public class UIStateModel: ObservableObject {
    @Published var activeCard: Int = 0
    @Published var screenDrag: Float = 0.0
}
