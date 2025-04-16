//
//  MainTabBarController.swift
//  NYTOILL
//
//  Created by Octavio Labastida Luna on 15/04/25.
//

import Foundation
import UIKit

///Clase que implementa un 'TabBarController' para la pantalla de Home
final class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers =  setUpViewController()
    }
    
    /// Esta funcion regresa un arreglo de UIViewController que requere un TabBarController
    /// - parameters:
    /// - returns:
    ///   Devuelve un arreglo de UIViewController's `
    func setUpViewController() -> [UIViewController]{
        return [createBarController(for: .mostPopular),
                createBarController(for: .facebBookPopular),
                createBarController(for: .emeiledPopular)]
    }
    /// Esta funcion regresa un UIViewController que implementa un TabBarItem
    /// - parameters:
    ///    - controller: Enum TabViewControllers que contine la estructura de un tabBarITem
    /// - returns:
    ///   Devuelve un TabViewControllers
    private func createBarController(for controller: MTBArticlesCategory) -> UIViewController{
        let viewController = MostPopularViewedRouter.createModule()
        let navBarController = UINavigationController(rootViewController: viewController)
        navBarController.tabBarItem.title = controller.title
        navBarController.tabBarItem.image = controller.image
        viewController.navigationItem.title = controller.title
        return navBarController
    }
}
