//
//  TheCatAPIViewModel.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 07/11/23.
//

import Foundation

class TheCatAPIViewModel: ObservableObject {
    @Published var cats: [TheCatModel]?
    // TODO: Need to figure out a better solution, currently this approach makes it difficult to test and provide a mock networking service.
    let provider: NetworkingService<TheCatAPI, [TheCatModel]>
    
    init(provider: NetworkingService<TheCatAPI, [TheCatModel]> = NetworkingService<TheCatAPI, [TheCatModel]>()) {
        self.provider = provider
    }
    
    func fetchCats() {
        provider.load(request: .search(quantity: "10"), decodedTo: [TheCatModel].self) { [self] result in
            switch result {
            case .success(let response):
                cats = response
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
