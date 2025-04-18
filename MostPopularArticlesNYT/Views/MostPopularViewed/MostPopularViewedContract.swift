//
//  MostPopularViewedContract.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 16/04/25.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewMostPopularViewedProtocol {
    var articles: [Article] { get set }
    func setArticlesInView(_ articles: [Article])
    func setErrorInView(_ error: Error)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMostPopularViewedProtocol {
    
    var view: PresenterToViewMostPopularViewedProtocol? { get set }
    var interactor: PresenterToInteractorMostPopularViewedProtocol? { get set }
    var router: PresenterToRouterMostPopularViewedProtocol? { get set }
    
    var mostPopularType: MTBArticlesCategory { get set }
    func getArticles()
    
    func goToDetail(article: String)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMostPopularViewedProtocol {
    
    var presenter: InteractorToPresenterMostPopularViewedProtocol? { get set }
    func getArticles(type: MTBArticlesCategory)

}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMostPopularViewedProtocol {
    func setArticles(_ articles: [Article])
    func setError(_ error: Error?)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMostPopularViewedProtocol {
    func goToDetail(view: PresenterToViewMostPopularViewedProtocol, article: String)
}
