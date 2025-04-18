//
//  UserDefaultManagerTests.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 17/04/25.
//


import XCTest
@testable import MostPopularArticlesNYT

class UserDefaultManagerTests: XCTestCase {
    
    var sut: UserDefaultManager!
    var mockUserDefaults: MockUserDefaults!
    
    var mockArticle1: Article = Article(uri: "", url: "", id: 1, assetID: 0, publishedDate: "", updated: "", section: "", nytdsection: "", adxKeywords: "", column: "", byline: "", title: "", abstract: "", desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: [], etaID: 0)
    var mockArticle2: Article = Article(uri: "", url: "", id: 2, assetID: 0, publishedDate: "", updated: "", section: "", nytdsection: "", adxKeywords: "", column: "", byline: "", title: "", abstract: "", desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: [], etaID: 0)
    
    override func setUp() {
        super.setUp()
        mockUserDefaults = MockUserDefaults()
        sut = UserDefaultManager(userDefault: mockUserDefaults)
    }
    
    override func tearDown() {
        sut = nil
        mockUserDefaults = nil
        super.tearDown()
    }
    
    func testSaveArticles_Success() {
        // Given
        let articles = [mockArticle1, mockArticle2]
        let type = "viewed"
        
        // When
        sut.saveArticles(type: type, article: articles)
        
        // Then
        XCTAssertNotNil(mockUserDefaults.savedData)
        XCTAssertEqual(mockUserDefaults.savedKey, "articlesList_viewed")
    }
    
    func testGetArticles_Success() {
        // Given
        let articles = [mockArticle1, mockArticle2]
        let type = "viewed"
        let encodedData = try! JSONEncoder().encode(articles)
        mockUserDefaults.mockData = encodedData
        
        // When
        let retrievedArticles = sut.getArticles(type: type)
        
        // Then
        XCTAssertNotNil(retrievedArticles)
        XCTAssertEqual(retrievedArticles?.count, articles.count)
        XCTAssertEqual(retrievedArticles?.first?.id, articles.first?.id)
    }
    
    func testGetArticles_NoData() {
        // Given
        let type = "viewed"
        mockUserDefaults.mockData = nil
        
        // When
        let retrievedArticles = sut.getArticles(type: type)
        
        // Then
        XCTAssertNil(retrievedArticles)
    }
    
    func testGetArticles_InvalidData() {
        // Given
        let type = "viewed"
        mockUserDefaults.mockData = Data([0, 1, 2, 3]) // Datos inválidos
        
        // When
        let retrievedArticles = sut.getArticles(type: type)
        
        // Then
        XCTAssertNil(retrievedArticles)
    }
    
    func testCustomKey() {
        // Given
        let customKey = "customKey"
        sut.key = customKey
        let articles = [mockArticle1, mockArticle2]
        let type = "viewed"
        
        // When
        sut.saveArticles(type: type, article: articles)
        
        // Then
        XCTAssertEqual(mockUserDefaults.savedKey, "\(customKey)_\(type)")
    }
}


