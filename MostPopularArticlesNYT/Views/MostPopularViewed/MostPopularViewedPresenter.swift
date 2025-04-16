//
//  MostPopularViewedPresenter.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 16/04/25.
//  
//

import Foundation

class MostPopularViewedPresenter: ViewToPresenterMostPopularViewedProtocol {

    // MARK: Properties
    var view: PresenterToViewMostPopularViewedProtocol?
    var interactor: PresenterToInteractorMostPopularViewedProtocol?
    var router: PresenterToRouterMostPopularViewedProtocol?
}

extension MostPopularViewedPresenter: InteractorToPresenterMostPopularViewedProtocol {
    
}
