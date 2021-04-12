//
//  HomeRequests.swift
//  SkyMobileTest
//
//  Created Patricia Souza on 17/7/2019.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//
import UIKit

typealias HomeDataCallback = (Result<[MovieEntity]>) -> Void

class HomeRequests: NSObject {

	// MARK: Prorpeties
    
    let http: HttpProtocol = Http()

	// MARK: Public Methods
    
    func requestHomeData(completion: @escaping HomeDataCallback) {
        self.http.request(SkyService.home, completion: completion)
    }
}
