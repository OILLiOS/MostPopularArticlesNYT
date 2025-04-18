//
//  UserDefaultManager.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 17/04/25.
//

import Foundation

protocol UserDefaultsProtocol {
    func data(forKey defaultName: String) -> Data?
    func setValue(_ value: Any?, forKey key: String)
    func returnArticlesDictionary(key: String) -> [Article]?
}

extension UserDefaults: UserDefaultsProtocol {
    func returnArticlesDictionary(key: String) -> [Article]?{
        guard let dataArticles = self.data(forKey: key),
              let dctArticles: [Article] = try? JSONDecoder().decode([Article].self, from: dataArticles) else { return nil}
        return dctArticles
    }
}

protocol UserDefaultManagerProtocol {
    var key: String { get set }
    func saveArticles(type: String, article: [Article])
}

final class UserDefaultManager: UserDefaultManagerProtocol {
    var key: String = "articlesList"
    let userDefault: UserDefaultsProtocol
    let decoder: JSONDecoder
    let encoder: JSONEncoder
    
    init(userDefault: UserDefaultsProtocol = UserDefaults.standard,
         decoder: JSONDecoder = JSONDecoder(),
         encoder:  JSONEncoder = JSONEncoder()) {
        self.userDefault = userDefault
        self.decoder = decoder
        self.encoder = encoder
    }
    
    func saveArticles(type: String, article: [Article]){
        if let data = try? encoder.encode(article){
            userDefault.setValue(data, forKey: "\(key)_\(type)")
        }
    }
    
    func getArticles(type: String) -> [Article]?{
        guard let arrArticles = userDefault.returnArticlesDictionary(key: "\(key)_\(type)") else { return nil }
        return arrArticles
    }
    
}
