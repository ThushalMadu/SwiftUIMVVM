//
//  HomeViewModel.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-29.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var shoppingItems = [ShoppingItem]()
    @Published var loading = true
    
    var homeDataService: HomeDataService = ItemApiService()
    
    
    init(homeDataService: HomeDataService = ItemApiService()) {
        self.homeDataService = homeDataService
    }
    
    func getHomeData() {
        homeDataService.loadData { [weak self]shoppingItems in
            self?.shoppingItems = shoppingItems
            self?.loading = false
        }
    }
    
}
