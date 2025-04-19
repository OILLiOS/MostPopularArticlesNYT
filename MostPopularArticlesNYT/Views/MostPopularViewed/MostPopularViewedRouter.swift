//
//  MostPopularViewedRouter.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 16/04/25.
//  
//

import Foundation
import UIKit

final class MostPopularViewedRouter: PresenterToRouterMostPopularViewedProtocol {
    
    // MARK: Static methods
    static func createModule(type: MTBArticlesCategory) -> UIViewController {
        
        let viewController = MostPopularViewedViewController()
                
        lazy var presenter: ViewToPresenterMostPopularViewedProtocol & InteractorToPresenterMostPopularViewedProtocol = MostPopularViewedPresenter()
        presenter.mostPopularType = type
        viewController.presenter = presenter
        viewController.presenter?.router = MostPopularViewedRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MostPopularViewedInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func goToDetail(view: PresenterToViewMostPopularViewedProtocol, article: String) {
        if let viewController = view as? UIViewController {
            let detailViewController = ArticleDetailRouter.createModule(url: article)
            viewController.navigationController?.pushViewController(detailViewController, animated: true)
        }
        
    }
    
}
