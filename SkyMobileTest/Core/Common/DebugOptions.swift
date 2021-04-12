//
//  DebugOptions.swift
//  SkyMobileTest
//
//  Created by Patricia Souza on 03/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//

func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
    Swift.print(items[0], separator: separator, terminator: terminator)
    #elseif MOCK
    Swift.print(items[0], separator: separator, terminator: terminator)
    #endif
}

struct Env {
    static let isMock: Bool = {
        #if MOCK
        return true
        #else
        return false
        #endif
    }()
    
    static func server() -> HttpProtocol {
        #if MOCK
        return HTTPStubs()
        #else
        return Http()
        #endif
    }
}

struct Platform {
    static let isSimulator: Bool = {
        #if arch(i386) || arch(x86_64)
        return true
        #else
        return false
        #endif
    }()
}

