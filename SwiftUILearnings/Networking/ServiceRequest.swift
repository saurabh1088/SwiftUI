//
//  ServiceRequest.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 02/11/23.
//

import Foundation

protocol ServiceRequest {
    var baseURL: String { get }
    var path: String { get }
    var params: [String: Any]? { get }
    var httpMethod: HTTPMethods { get }
}
