//
//  MostPopularViewedInteractor.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 16/04/25.
//  
//

import Foundation

final class MostPopularViewedInteractor: PresenterToInteractorMostPopularViewedProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterMostPopularViewedProtocol?
    
    func getArticles(type: MTBArticlesCategory) {
        NYTApiMostPopularArticles().getArticles(path: getarticlePath(type: type)) {[weak self] (articles, error) in
            if let arrayOfArticles = articles{
                self?.presenter?.setArticles(arrayOfArticles)
            }else{
                self?.presenter?.setError(error)
            }
        }
    }
    
    private func getarticlePath(type: MTBArticlesCategory) -> MostPopularArticlesPahts {
        switch type {
        case .mostPopular:
            return MostPopularArticlesPahts.view("1")
        case .facebBookPopular:
            return MostPopularArticlesPahts.shared("1", "facebook")
        case .emeiledPopular:
            return MostPopularArticlesPahts.mailed("1")
        }
    }
}
