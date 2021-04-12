//
//  SkyServiceMock.swift
//  SkyMobileTestTests
//
//  Created by Patricia Souza on 03/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//

import Foundation

@testable import SkyMobileTest

enum SkyServiceMock: Equatable, SkyServiceProtocol {
    case aService
}

extension SkyServiceMock {
    var path: URL {
        return baseURL.appendingPathComponent("/endPath")
    }
    
    var method: HttpMethod {
        return .get
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
