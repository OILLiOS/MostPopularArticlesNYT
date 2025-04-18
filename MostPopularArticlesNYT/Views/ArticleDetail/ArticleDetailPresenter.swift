//
//  ArticleDetailPresenter.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 17/04/25.
//  
//

import Foundation

class ArticleDetailPresenter: ViewToPresenterArticleDetailProtocol {

    // MARK: Properties
    var view: PresenterToViewArticleDetailProtocol?
    var interactor: PresenterToInteractorArticleDetailProtocol?
    var router: PresenterToRouterArticleDetailProtocol?
    
    var stringURLArticle: String?
    
    func loadURL() {
        interactor?.getRequestURLArticle(urlText: stringURLArticle ?? "")
    }
    
}

extension ArticleDetailPresenter: InteractorToPresenterArticleDetailProtocol {
    func loadURLinView(url: URLRequest?) {
        view?.loadURL(url: url)
    }
    
    
}
