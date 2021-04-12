//
//  MovieEntity.swift
//  SkyMobileTest
//
//  Created by Patricia Souza on 17/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//

import Foundation

class MovieEntity: Codable {
    let id: String
    let title: String
    let overview: String
    let duration: String
    let releaseYear: String
    let coverUrl: String
    let backdropsUrl: [String]
}
