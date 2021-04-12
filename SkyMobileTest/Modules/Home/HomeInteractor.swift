//
//  HomeInteractor.swift
//  SkyMobileTest
//
//  Created Patricia Souza on 17/7/2019.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//
import UIKit



class HomeInteractor: NSObject {

    // MARK: - Viper Properties

    weak var output: HomeInteractorOutputProtocol!

    // MARK: - Internal Properties
    var homeRequests: HomeRequests = HomeRequests()
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
}

// MARK: - HomeInteractorInputProtocol

extension HomeInteractor: HomeInteractorInputProtocol {
    func fetchMovies() {
        
        self.homeRequests.requestHomeData { result in
        
            switch result {
            case .success(let movies):
                self.output.didFetchMoviesSuccess(movies)
            case .error(let error):
                self.output.didFetchMoviesFail(error)
            }
        }
    }
}
