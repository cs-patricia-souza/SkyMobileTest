//
//  MovieDetailProtocols.swift
//  SkyMobileTest
//
//  Created by Patricia Souza on 17/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//
import Foundation

// MARK: - Wireframe

protocol MovieDetailWireframeProtocol: class {

}

// MARK: - Interactor

protocol MovieDetailInteractorInputProtocol {
    var movie: MovieEntity { get }

}

// MARK: - Presenter

protocol MovieDetailPresenterInputProtocol: class {
	func viewDidLoad()
}

protocol MovieDetailInteractorOutputProtocol: class {

}

// MARK: - View

protocol MovieDetailPresenterOutputProtocol: class {
    func setupTitle(_ title: String)

}
