//
//  MostPopularViewedRouter.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 16/04/25.
//  
//

import Foundation
import UIKit

class MostPopularViewedRouter: PresenterToRouterMostPopularViewedProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = MostPopularViewedViewController()
        
        let presenter: ViewToPresenterMostPopularViewedProtocol & InteractorToPresenterMostPopularViewedProtocol = MostPopularViewedPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MostPopularViewedRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MostPopularViewedInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
