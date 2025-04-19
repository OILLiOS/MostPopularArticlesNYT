//
//  ApiPathsTests.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 17/04/25.
//


import XCTest
@testable import MostPopularArticlesNYT

final class ApiPathsTests: XCTestCase {
    
    func testMostPopularArticlesPahts_MostViewed() {
        // Given
        let path = MostPopularArticlesPahts.view("1")
        
        // Then
        XCTAssertEqual(path.urlRequest?.url?.absoluteString, "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=qTl6HA9lEk9bHwEMNSrdjRAceMnSqQEZ")
        XCTAssertEqual(path.localKey, "view")
    }
    
    func testMostPopularArticlesPahts_MostShared() {
        // Given
        let path = MostPopularArticlesPahts.shared("1", "facebook")
        
        // Then
        XCTAssertEqual(path.urlRequest?.url?.absoluteString, "https://api.nytimes.com/svc/mostpopular/v2/shared/1/facebook.json?api-key=qTl6HA9lEk9bHwEMNSrdjRAceMnSqQEZ")
        XCTAssertEqual(path.localKey, "shared")
    }
    
    func testMostPopularArticlesPahts_MostEmailed() {
        // Given
        let path = MostPopularArticlesPahts.mailed("1")
        
        // Then
        XCTAssertEqual(path.urlRequest?.url?.absoluteString, "https://api.nytimes.com/svc/mostpopular/v2/emailed/1.json?api-key=qTl6HA9lEk9bHwEMNSrdjRAceMnSqQEZ")
        XCTAssertEqual(path.localKey, "mailed")
    }
    
    func testMostPopularArticlesPahts_UrlRequestContainsApiKey() {
        // Given
        let path = MostPopularArticlesPahts.view("1")
        
        // Then
        XCTAssertTrue(path.urlRequest?.url?.absoluteString.contains("api-key") ?? false)
    }
} 
