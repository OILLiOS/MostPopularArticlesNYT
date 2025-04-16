//
//  MostPopularViewedViewController.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 16/04/25.
//

import UIKit

class MostPopularViewedViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterMostPopularViewedProtocol?
    
}

extension MostPopularViewedViewController: PresenterToViewMostPopularViewedProtocol{
    // TODO: Implement View Output Methods
}
