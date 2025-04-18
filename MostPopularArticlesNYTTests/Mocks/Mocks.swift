//
//  Mocks.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 17/04/25.
//

import XCTest
@testable import MostPopularArticlesNYT

// MARK: - UserDefaults Protocol
protocol UserDefaultsManaging {
    func getArticles(type: String) -> [Article]?
    func saveArticles(type: String, article: [Article])
}

// MARK: - API Protocol
protocol NYTApiProtocol {
    func getArticles(path: MostPopularArticlesPahts, handlerback: @escaping (([Article]?, Error?) -> Void))
}

// MARK: - Mock Classes
class MockUserDefaultsManager: UserDefaultsManaging {
    var savedArticles: [Article]?
    
    func getArticles(type: String) -> [Article]? {
        return savedArticles
    }
    
    func saveArticles(type: String, article: [Article]) {
        savedArticles = article
    }
}

class MockNetworkConnectionManager: NetworkConnectionManager {
    var hasConnection = true
    var shouldFail = false
    
    override func phoneHaveConnection() -> Bool {
        return hasConnection
    }
}

// MARK: - Mock NYTApi
class MockNYTApi: NYTApiProtocol {
    var shouldFail = false
    let realApi: NYTApiMostPopularArticles
    let mockNetworkManager: MockNetworkConnectionManager
    let mockUserDefaults: MockUserDefaultsManager
    
    init(networkManager: MockNetworkConnectionManager, userDefaults: MockUserDefaultsManager) {
        self.mockNetworkManager = networkManager
        self.mockUserDefaults = userDefaults
        self.realApi = NYTApiMostPopularArticles()
    }
    
    func getArticles(path: MostPopularArticlesPahts, handlerback: @escaping (([Article]?, Error?) -> Void)) {
        if shouldFail {
            handlerback(nil, ApiError.defaultError)
        } else {
            if mockNetworkManager.phoneHaveConnection() {
                realApi.getArticles(path: path, handlerback: handlerback)
            } else {
                if let localArticles = mockUserDefaults.getArticles(type: path.localKey) {
                    handlerback(localArticles, ApiError.noInternetConnection)
                } else {
                    handlerback(nil, ApiError.noInternetConnection)
                }
            }
        }
    }
}

// MARK: - Mock Classes
class MockURLSession: URLSession {
    var mockData: Data?
    var mockError: Error?
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = MockURLSessionDataTask()
        task.completionHandler = {
            completionHandler(self.mockData, nil, self.mockError)
        }
        return task
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    var completionHandler: (() -> Void)?
    
    override func resume() {
        completionHandler?()
    }
}

// MARK: - Mock Classes
class MockBundle: Bundle {
    private let mockInfoDictionary: [String: Any]?
    
    init(infoDictionary: [String: Any]?) {
        self.mockInfoDictionary = infoDictionary
        super.init()
    }
    
    override var infoDictionary: [String: Any]? {
        return mockInfoDictionary
    }
}

// MARK: - Mock Classes
class MockUserDefaults: UserDefaultsProtocol {
    var mockData: Data?
    var savedData: Data?
    var savedKey: String?
    
    func data(forKey defaultName: String) -> Data? {
        return mockData
    }
    
    func setValue(_ value: Any?, forKey key: String) {
        savedData = value as? Data
        savedKey = key
    }
    
    func returnArticlesDictionary(key: String) -> [Article]? {
        guard let data = mockData else { return nil }
        return try? JSONDecoder().decode([Article].self, from: data)
    }
} 
