//
//  NetworkingService.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 31/10/23.
//

import Foundation

enum HTTPMethods: String {
    /// http method GET is used to request a specified resource, it's only used to retrieve some data. GET is
    /// expected to be a safe operation, means it will not change state of any resource on server.
    case GET
    
    /// http method HEAD is used to get metadata associated with a resource on server. Calling HEAD will
    /// return all headers associated with a resource at given URL, but it will actually not return the resource
    /// itself unlike GET method.
    /// HEAD can be used to
    /// - Check size of resource on server
    /// - If resource is present or not on server
    /// - The last modified time/date of the resource
    /// - Validity of a cached resource
    case HEAD
    case POST
    case PUT
    case DELETE
    case CONNECT
    case OPTIONS
    case TRACE
    case PATCH
}

protocol NetworkingService {
    var baseURL: String { get }
    var path: String { get }
    var params: [String: Any]? { get }
    var httpMethod: HTTPMethods { get }
}
