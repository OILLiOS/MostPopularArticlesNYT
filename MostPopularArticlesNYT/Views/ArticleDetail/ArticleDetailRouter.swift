//
//  ArticleDetailRouter.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 17/04/25.
//  
//

import Foundation
import UIKit

class ArticleDetailRouter: PresenterToRouterArticleDetailProtocol {
    
    // MARK: Static methods
    static func createModule(url: String) -> UIViewController {
        
        let viewController = ArticleDetailViewController()
        
        lazy var presenter: ViewToPresenterArticleDetailProtocol & InteractorToPresenterArticleDetailProtocol = ArticleDetailPresenter()
        presenter.stringURLArticle = url
        
        viewController.presenter = presenter
        viewController.presenter?.router = ArticleDetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ArticleDetailInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
