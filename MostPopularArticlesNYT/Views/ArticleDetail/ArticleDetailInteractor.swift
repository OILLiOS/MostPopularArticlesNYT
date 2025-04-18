//
//  ArticleDetailInteractor.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 17/04/25.
//  
//

import Foundation

class ArticleDetailInteractor: PresenterToInteractorArticleDetailProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterArticleDetailProtocol?
    
    func getRequestURLArticle(urlText: String) {
        if let link = URL(string: urlText){
            presenter?.loadURLinView(url: URLRequest(url: link))
        }    
    }
}
