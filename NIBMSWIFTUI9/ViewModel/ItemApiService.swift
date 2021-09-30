//
//  ItemApiService.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-05.
//

import Foundation


// CHECK WITHOUT LOADER AND PRINT ALL THE FUNCTION IS CALLING AND CHECK PROTOCOL SUCESSFULLY CALLED


protocol HomeDataService {
    func loadData(completion:@escaping ([ShoppingItem]) -> ())
}

class ItemApiService: HomeDataService {
        
    func loadData(completion:@escaping ([ShoppingItem]) -> ()) {
        
        guard let url = URL(string: "https://excome.herokuapp.com/foods/allFoods") else {
            print("Invalid url...")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            let shoppingItems = try! JSONDecoder().decode([ShoppingItem].self, from: data!)
            print(shoppingItems)
            //            In swiftui two main process  dispatch with main and dispatch with global( BackGround Thread )
            //            we can use global(background) and inside of that background can use MAIN thread
            DispatchQueue.main.async {   //UI UPDATES ALWAYS SHOULD HAPPEN THE MAIN THREAD
                completion(shoppingItems)
            }
        }.resume()
    }
}
