//
//  ApiPathProtocol.swift
//  NYTOILL
//
//  Created by Octavio Labastida Luna on 16/04/25.
//

import Foundation

///Estructura que contiene EndPoints y URls del Api de NYT
protocol ApiPathProtocol{
    var pathBase: String { get }
    var apiKey: String { get }
    var endPoint: String { get }
    var urlRequest: URLRequest? { get }
    var localKey: String { get }
}

extension ApiPathProtocol{
    var pathBase: String{
        return "https://api.nytimes.com/svc/mostpopular/v2/"
    }
    var apiKey: String{
        return "?api-key=qTl6HA9lEk9bHwEMNSrdjRAceMnSqQEZ"
    }
}

enum MostPopularArticlesPahts{
    case view(String)
    case mailed(String)
    case shared(String, String)
}

extension MostPopularArticlesPahts: ApiPathProtocol{
    var endPoint: String {
        switch self {
        case .view(let period):
            return "viewed/\(period)"
        case .mailed(let period):
            return "emailed/\(period)"
        case .shared(let share_type, let period):
            return "shared/\(share_type)/\(period)"
        }
    }
    
    var urlRequest: URLRequest?{
        let urlString = self.pathBase + self.endPoint + ".json" + self.apiKey
        guard let url = URL(string: urlString) else { return nil }
        return URLRequest(url: url)
    }
    
    var localKey: String {
        switch self {
        case .view( _):
            return "view"
        case .mailed( _):
            return "mailed"
        case .shared( _, _):
            return "shared"
        }
    }
}
