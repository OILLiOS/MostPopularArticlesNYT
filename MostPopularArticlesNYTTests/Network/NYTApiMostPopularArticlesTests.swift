//
//  NYTApiMostPopularArticlesTests.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 17/04/25.
//


import XCTest
@testable import MostPopularArticlesNYT


final class NYTApiMostPopularArticlesTests: XCTestCase {
    
    var sut: MockNYTApi!
    var mockNetworkManager: MockNetworkConnectionManager!
    var mockUserDefaults: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkConnectionManager()
        mockUserDefaults = MockUserDefaultsManager()
        sut = MockNYTApi(networkManager: mockNetworkManager, userDefaults: mockUserDefaults)
    }
    
    override func tearDown() {
        sut = nil
        mockNetworkManager = nil
        mockUserDefaults = nil
        super.tearDown()
    }
    
    func testGetArticles_WithInternetConnection_Success() {
        // Given
        let expectation = self.expectation(description: "Get articles with internet")
        mockNetworkManager.hasConnection = true
        sut.shouldFail = false
        
        // When
        sut.getArticles(path: .view("1")) { articles, error in
            // Then
            XCTAssertNotNil(articles)
            XCTAssertNil(error)
            XCTAssertEqual(articles?.count, 20) // La API devuelve 20 artículos por defecto
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0)
    }
    
    func testGetArticles_WithInternetConnection_Failure() {
        // Given
        let expectation = self.expectation(description: "Get articles with internet failure")
        mockNetworkManager.hasConnection = true
        sut.shouldFail = true // Simulamos el fallo en la llamada a la API
        
        // When
        sut.getArticles(path: .view("1")) { articles, error in
            // Then
            XCTAssertNil(articles)
            XCTAssertNotNil(error)
            XCTAssertEqual(error as? ApiError, ApiError.defaultError)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0)
    }
    
    func testGetArticles_WithoutInternetConnection_WithLocalData() {
        // Given
        let expectation = self.expectation(description: "Get articles without internet with local data")
        let mockArticles = Array(repeating: Article(uri: "", url: "", id: 0, assetID: 0, publishedDate: "", updated: "", section: "", nytdsection: "", adxKeywords: "", column: "", byline: "", title: "", abstract: "", desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: [], etaID: 0), count: 20)
        mockNetworkManager.hasConnection = false
        mockUserDefaults.savedArticles = mockArticles
        
        // When
        sut.getArticles(path: .view("1")) { articles, error in
            // Then
            XCTAssertNotNil(articles)
            XCTAssertNotNil(error)
            XCTAssertEqual(articles?.count, 20) // Verificamos que se devuelvan los 20 artículos guardados
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0)
    }
    
    func testGetArticles_WithoutInternetConnection_WithoutLocalData() {
        // Given
        let expectation = self.expectation(description: "Get articles without internet without local data")
        mockNetworkManager.hasConnection = false
        mockUserDefaults.savedArticles = nil
        
        // When
        sut.getArticles(path: .view("1")) { articles, error in
            // Then
            XCTAssertNil(articles)
            XCTAssertNotNil(error)
            XCTAssertEqual(error as? ApiError, ApiError.noInternetConnection)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0)
    }
}


