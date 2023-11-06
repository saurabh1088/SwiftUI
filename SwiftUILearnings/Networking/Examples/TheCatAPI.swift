//
//  TheCatAPI.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 06/11/23.
//

import Foundation

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
