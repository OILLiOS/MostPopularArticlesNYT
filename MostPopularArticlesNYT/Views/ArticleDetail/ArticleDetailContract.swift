//
//  ArticleDetailContract.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 17/04/25.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewArticleDetailProtocol {
    func loadURL(url: URLRequest?)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterArticleDetailProtocol {
    
    var view: PresenterToViewArticleDetailProtocol? { get set }
    var interactor: PresenterToInteractorArticleDetailProtocol? { get set }
    var router: PresenterToRouterArticleDetailProtocol? { get set }
    
    var stringURLArticle: String? { get set }
    func loadURL()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorArticleDetailProtocol {
    
    var presenter: InteractorToPresenterArticleDetailProtocol? { get set }
    
    func getRequestURLArticle(urlText: String)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterArticleDetailProtocol {
    func loadURLinView(url: URLRequest?)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterArticleDetailProtocol {
    
}
