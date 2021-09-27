//
//  BannerItemService.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-27.
//

import Foundation
import Alamofire

class BannerItemService: ObservableObject {
    @Published var bannerItems = [BannerModel]()
    @Published var errorMessage = ""
    @Published var loading = true

    func getBannerData(completion:@escaping ([BannerModel]) -> ()) {
        
        guard let url = URL(string: "https://aqueous-temple-31849.herokuapp.com/banner/showAllBanner") else {
            print("Invalid url...")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            let bannerItems = try! JSONDecoder().decode([BannerModel].self, from: data!)
            print(bannerItems)
            DispatchQueue.main.async {
                completion(bannerItems)
                self.loading = false
            }
        }.resume()
    }
    
    
}
