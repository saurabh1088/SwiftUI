//
//  TheCatAPI.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 06/11/23.
//

import Foundation

/// API documentation available at :
/// https://developers.thecatapi.com/view-account/ylX4blBYT9FaoVd6OhvR?report=FJkYOq9tW
enum TheCatAPI {
    case search(quantity: String)
}

extension TheCatAPI: ServiceRequest {
    var baseURL: String {
        return "https://api.thecatapi.com"
    }
    
    var path: String {
        return "/v1/images/search"
    }
    
    var params: [String : Any]? {
        var params: [String: Any] = [:]
        switch self {
        case .search(let quantity):
            params["limit"] = quantity
        }
        return params
    }
    
    var httpMethod: HTTPMethods {
        return .GET
    }
}
