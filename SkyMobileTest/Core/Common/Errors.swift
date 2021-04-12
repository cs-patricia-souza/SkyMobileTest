//
//  Errors.swift
//  SkyMobileTest
//
//  Created by Patricia Souza on 03/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//

import UIKit

import Foundation

enum CommonError: Error {
    case invalidPath
    case couldNotDecode
}

protocol NSErrorCompatible {
    func toNSError() -> NSError
}

enum HTTPError: Error, NSErrorCompatible {
    case noResponse
    case noData(Error?)
    case invalidRequestData
    case unsuccesfulStatusCode(Error?)
    case unauthorizedAccess(Error?)
    case couldNotDecode
    
    private var errorUserInfo: [String: Any] {
        switch self {
        case .noData(let error), .unsuccesfulStatusCode(let error), .unauthorizedAccess(let error):
            return ["localizedDescription": error?.localizedDescription ?? ""]
        default:
            return [:]
        }
    }
    
    private var errorCode: Int {
        switch self {
        case .noResponse: return 101
        case .noData: return 102
        case .invalidRequestData: return 103
        case .unsuccesfulStatusCode: return 104
        case .unauthorizedAccess: return 105
        case .couldNotDecode: return 106
        }
    }
    
    private var errorDomain: String {
        switch self {
        case .noResponse: return "noResponse"
        case .noData: return "noData"
        case .invalidRequestData: return "invalidRequestData"
        case .unsuccesfulStatusCode: return "unsuccesfulStatusCode"
        case .unauthorizedAccess: return "unauthorizedAccess"
        case .couldNotDecode: return "couldNotDecode"
        }
    }
    
    func toNSError() -> NSError {
        return NSError(domain: "HTTPError.\(self.errorDomain)",
            code: self.errorCode,
            userInfo: self.errorUserInfo)
    }
}

