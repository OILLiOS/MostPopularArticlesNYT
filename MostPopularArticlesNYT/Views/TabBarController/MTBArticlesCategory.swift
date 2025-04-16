//
//  ArticlesCategory.swift
//  NYTOILL
//
//  Created by Octavio Labastida Luna on 15/04/25.
//

import Foundation
import UIKit

///Protocolo que implementa la estructura que debe tener el un tabBarItem
protocol ViewPropertiesProtocol{
    ///propiedad que regresa un String con la descripcion del titulo del elemento
    var title: String { get }
    ///propiedad que regresa un UIImage con la representacion del Icono del elemento
    var image: UIImage? { get }
}


enum MTBArticlesCategory{
    case mostPopular
    case facebBookPopular
    case emeiledPopular
}

extension MTBArticlesCategory: ViewPropertiesProtocol{
    var title: String {
        switch self {
        case .mostPopular:
            return "Most Popular viewed"
        case .facebBookPopular:
            return "Most shared on Facebook"
        case .emeiledPopular:
            return "Most shared for Email"
        }
    }
    var image: UIImage? {
        switch self {
        case .mostPopular:
            return UIImage(systemName: "chart.line.uptrend.xyaxis")
        case .facebBookPopular:
            return UIImage(systemName: "f.square")
        case .emeiledPopular:
            return UIImage(systemName: "envelope")
        }
    }
}
