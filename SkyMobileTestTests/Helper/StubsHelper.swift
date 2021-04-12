//
//  StubsHelper.swift
//  SkyMobileTestTests
//
//  Created by Patricia Souza on 03/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//

import OHHTTPStubs

class StubsHelper {
    
    func setHomeStubs() {
        stub(condition: isPath("/app/checking-account/branches/1/accounts/140/balance")) { _ in
            return self.fixtureForFile("HomeResponse.json")
        }
    }
    
    private func fixtureForFile(_ file: String) -> OHHTTPStubsResponse {
        let stubPath = OHPathForFile(file, type(of: self))
        return fixture(filePath: stubPath!,
                       headers: ["Content-Type": "application/json"])
    }
}

