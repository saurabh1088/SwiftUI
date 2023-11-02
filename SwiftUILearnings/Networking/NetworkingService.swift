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
    
    /// http method POST submits an entity to a specified resource, this may lead to change in state for the
    /// server, because of this POST operation is not considered a safe operation.
    case POST
    
    /// http method PUT completely replaces the resource identified by URL. Resource if present is replaced
    /// completely else if not present then it gets created.
    case PUT
    
    
    case DELETE
    
    /// http method CONNECT is used to create a tunnel with server, which eventually could be used to forward
    /// data in both directions.
    case CONNECT
    
    
    case OPTIONS
    case TRACE
    case PATCH
}

enum Result<T> {
    case success(T)
    case failure(Error)
}

protocol ServiceRequest {
    var baseURL: String { get }
    var path: String { get }
    var params: [String: Any]? { get }
    var httpMethod: HTTPMethods { get }
}

protocol NetworkingServiceProvider {
    associatedtype T: ServiceRequest
    
    func load(request: T, completion: @escaping (Result<Data>) -> Void)
}
