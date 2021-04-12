//
//  HomePresenter.swift
//  SkyMobileTest
//
//  Created Patricia Souza on 17/7/2019.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//
import UIKit

class HomePresenter: NSObject {

    // MARK: - Viper Properties

    weak var view: HomePresenterOutputProtocol!
    var interactor: HomeInteractorInputProtocol!
    var wireframe: HomeWireframeProtocol!

    // MARK: - Internal Properties
    var dataSource: [MovieEntity] = []
}

// MARK: - HomePresenterInputProtocol

extension HomePresenter: HomePresenterInputProtocol {

    // MARK: - Internal Methods

    func viewDidLoad() {
        self.interactor.fetchMovies()
    }
    
    func didSelectMovie(_ movie: MovieEntity) {
        self.wireframe.didSelectMovie(movie)
    }
}

// MARK: - HomeInteractorOutputProtocol

extension HomePresenter: HomeInteractorOutputProtocol {

    func didFetchMoviesSuccess(_ movies: [MovieEntity]) {
        print("Movies: \(movies)")
        self.dataSource = movies
        
        self.view.reloadCollectionView()
    }
    
    func didFetchMoviesFail(_ error: Error) {
        
    }
}
