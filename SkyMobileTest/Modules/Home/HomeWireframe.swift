//
//  HomeWireframe.swift
//  SkyMobileTest
//
//  Created Patricia Souza on 17/7/2019.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//
import UIKit

class HomeWireframe: NSObject {

    // MARK: - Viper Properties

    var view: HomeView?

    // MARK: - Private Properties

    private let nibName = "Home"
    private let viewIdentifier = "HomeView"
    private var navigationController: UINavigationController = UINavigationController() {
        didSet {
            let navigationBar = self.navigationController.navigationBar
            navigationBar.barTintColor = .black
            navigationBar.tintColor = .white
            navigationBar.isOpaque = false
            navigationBar.isTranslucent = true
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            
            if #available(iOS 11.0, *) {
                navigationBar.prefersLargeTitles = true
                navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            }
        }
    }

    // MARK: - Inits

    override init() {
        super.init()

        let view = self.viewControllerFromXib()
        let interactor = HomeInteractor()
        let presenter = HomePresenter()

        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = view

        view.presenter = presenter
        interactor.output = presenter

        self.view = view
    }

    // MARK: - Internal Methods
    
    func setupWindow(_ window: UIWindow) {
        guard let view = self.view else {return}
        
        self.navigationController = UINavigationController(rootViewController: view)
        
        window.rootViewController = self.navigationController
    }

    // MARK: - Private Methods

    private func viewControllerFromXib() -> HomeView {
        let homeView = HomeView(nibName: self.nibName, bundle: nil)
        
        return homeView
    }
}

// MARK: - HomeWireframeProtocol

extension HomeWireframe: HomeWireframeProtocol {
  
    func didSelectMovie(_ movie: MovieEntity) {
        let movieDetail = MovieDetailWireframe(movie: movie)
        movieDetail.present(with: self.navigationController)
    }
}
