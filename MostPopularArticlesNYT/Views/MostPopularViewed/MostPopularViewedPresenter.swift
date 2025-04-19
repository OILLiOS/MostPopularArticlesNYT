//
//  MostPopularViewedPresenter.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 16/04/25.
//  
//

import Foundation
import UIKit

final class MostPopularViewedPresenter: ViewToPresenterMostPopularViewedProtocol {

    // MARK: Properties
    var view: PresenterToViewMostPopularViewedProtocol?
    var interactor: PresenterToInteractorMostPopularViewedProtocol?
    var router: PresenterToRouterMostPopularViewedProtocol?
    var mostPopularType: MTBArticlesCategory = .mostPopular
    
    func getArticles() {
        self.interactor?.getArticles(type: self.mostPopularType)
    }
    
    func goToDetail(article: String) {
        if let view = self.view {
            router?.goToDetail(view: view, article: article)
        }
    }
}

extension MostPopularViewedPresenter: InteractorToPresenterMostPopularViewedProtocol {
    func setArticles(_ articles: [Article]) {
        view?.setArticlesInView(articles.sorted(by: {$0.publishedDate.toPublishedDate ?? Date() > $1.publishedDate.toPublishedDate ?? Date()}))
    }
    
    func setError(_ error: (any Error)?) {
        if let error = error {
            view?.setErrorInView(error)
        }
    }
}
