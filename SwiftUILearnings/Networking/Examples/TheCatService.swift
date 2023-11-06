//
//  TheCatService.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 06/11/23.
//

import Foundation

class TheCatService {
    let provider: NetworkingService<TheCatAPI, [TheCatModel]>
    
    init(provider: NetworkingService<TheCatAPI, [TheCatModel]> = NetworkingService<TheCatAPI, [TheCatModel]>()) {
        self.provider = provider
    }
    
    func fetchCats() {
        provider.load(request: .search(quantity: "10"), decodedTo: [TheCatModel].self) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
