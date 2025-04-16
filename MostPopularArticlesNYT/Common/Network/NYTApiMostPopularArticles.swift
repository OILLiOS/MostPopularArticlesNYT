//
//  NYTApi.swift
//  NYTOILL
//
//  Created by Octavio Labastida Luna on 16/04/25.
//

import Foundation
///Clase que implementa el protocolo GenericApi para obtener Peliculas de la  Api MovieDB
/// - parameters:
///    - movieURLRequest: Request  a consumir
/// - returns:
///   Devuelve un Result con <Modelo, error>
///
final class NYTApiMostPopularArticles: GenericAPIProtocol {
    var apiError: ApiError = .defaultError
    var handlerBack: (([Article]?, Error?) -> Void)?
    
    func getArticles(path: MostPopularArticlesPahts){
        fetch(ApiURLRequest: path.urlRequest, completionHandler: handlerGetArticlesResult(result:))
    }
    
    func handlerGetArticlesResult(result: Result<ArticlesResponse?, Error>) {
        switch result {
        case .failure(let fail):
            self.handlerBack?(nil, fail)
        case .success(let response):
            self.handlerBack?(response?.results, nil)
        }
    }

}

