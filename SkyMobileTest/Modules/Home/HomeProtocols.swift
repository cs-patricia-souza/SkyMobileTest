//
//  HomeProtocols.swift
//  SkyMobileTest
//
//  Created Patricia Souza on 17/7/2019.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//
import UIKit

// MARK: - Wireframe

protocol HomeWireframeProtocol: class {
    func setupWindow(_ window: UIWindow)
    func didSelectMovie(_ movie: MovieEntity)
}

// MARK: - Interactor

protocol HomeInteractorInputProtocol {
    func fetchMovies()
}

// MARK: - Presenter

protocol HomePresenterInputProtocol: class {
    var dataSource: [MovieEntity] { get }
    func viewDidLoad()
    func didSelectMovie(_ movie: MovieEntity)
}

protocol HomeInteractorOutputProtocol: class {
    func didFetchMoviesSuccess(_ movies: [MovieEntity])
    func didFetchMoviesFail(_ error: Error)
}

// MARK: - View

protocol HomePresenterOutputProtocol: class {
    func reloadCollectionView()
}
