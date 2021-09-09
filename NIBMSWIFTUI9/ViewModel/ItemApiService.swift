//
//  ItemApiService.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-05.
//

import Foundation

class ItemApiService:ObservableObject {
    @Published var shoppingItems = [ShoppingItem]()
    @Published var loading = true
    
    func loadData(completion:@escaping ([ShoppingItem]) -> ()) {
        
        guard let url = URL(string: "https://excome.herokuapp.com/foods/allFoods") else {
            print("Invalid url...")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            let shoppingItems = try! JSONDecoder().decode([ShoppingItem].self, from: data!)
//            print(shoppingItems)
            DispatchQueue.main.async {
                completion(shoppingItems)
                self.loading = false
            }
        }.resume()
    }
}
