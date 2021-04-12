//
//  Result.swift
//  SkyMobileTest
//
//  Created by Patricia Souza on 03/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//

enum Result<T> {
    case success(T)
    case error(Error)
}

extension Result where T == Void {
    static var success: Result {
        return .success(())
    }
}
