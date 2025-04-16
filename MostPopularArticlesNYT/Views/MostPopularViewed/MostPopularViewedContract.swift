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
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMostPopularViewedProtocol {
    
    var view: PresenterToViewMostPopularViewedProtocol? { get set }
    var interactor: PresenterToInteractorMostPopularViewedProtocol? { get set }
    var router: PresenterToRouterMostPopularViewedProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMostPopularViewedProtocol {
    
    var presenter: InteractorToPresenterMostPopularViewedProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMostPopularViewedProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMostPopularViewedProtocol {
    
}
