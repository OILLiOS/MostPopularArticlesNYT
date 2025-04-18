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
    var apiError: ApiError? = .defaultError

    
    func getArticles(path: MostPopularArticlesPahts, handlerback: @escaping (([Article]?, Error?) -> Void)){
        let networkManager = NetworkConnectionManager.sharedInstance
        if networkManager.phoneHaveConnection(){
            fetch(ApiURLRequest: path.urlRequest, completionHandler: { [weak self] (result: Result<ArticlesResponse?, Error>) in
                switch result {
                case .failure(let fail):
                    self?.apiError = fail as? ApiError
                    handlerback(nil, self?.apiError)
                case .success(let response):
                    if let articles = response?.results{
                        UserDefaultManager().saveArticles(type: path.localKey, article: articles)
                        handlerback(response?.results, nil)
                    }else{
                        self?.apiError = .dontHaveResults
                        handlerback(nil, self?.apiError)
                    }
                }
            })
        }else{
            self.apiError = .noInternetConnection
            if let localArticles = UserDefaultManager().getArticles(type: path.localKey){
                handlerback(localArticles, self.apiError)
            }else{
                handlerback(nil, self.apiError)
            }
        }
    }
    


}

