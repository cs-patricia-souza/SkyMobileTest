//
//  SkyService.swift
//  SkyMobileTest
//
//  Created by Patricia Souza on 03/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//
import Foundation

enum SkyService: Equatable, SkyServiceProtocol {
    case home
}

extension SkyService {
    var path: URL {
        guard !Env.isMock else {
            return stubURLFor(service: self)
        }
        
        switch self {
        case .home:
            return baseURL.appendingPathComponent("/api/Movies")
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .home:
            return .get
        default:
            return .post
        }
    }
    
    var params: Data? {
        return nil
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
    var headers: [String: String] {
        return ["Content-Type": "application/json"]
    }
}

extension SkyService {
    private func stubURLFor(service: SkyService) -> URL {
        switch service {
        case .home:
            return getStubURL(with: "HomeResponse")
        }
    }
}
