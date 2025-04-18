//
//  BundleExtensionTests.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 17/04/25.
//

import XCTest
@testable import MostPopularArticlesNYT

class BundleExtensionTests: XCTestCase {
    
    func testApplicationName_WithDisplayName() {
        // Given
        let mockInfoDictionary: [String: Any] = [
            "CFBundleDisplayName": "NYT App"
        ]
        let mockBundle = MockBundle(infoDictionary: mockInfoDictionary)
        
        // When
        let appName = mockBundle.applicationName
        
        // Then
        XCTAssertEqual(appName, "NYT App")
    }
    
    func testApplicationName_WithBundleName() {
        // Given
        let mockInfoDictionary: [String: Any] = [
            "CFBundleName": "NYT"
        ]
        let mockBundle = MockBundle(infoDictionary: mockInfoDictionary)
        
        // When
        let appName = mockBundle.applicationName
        
        // Then
        XCTAssertEqual(appName, "NYT")
    }
    
    func testApplicationName_WithBothNames() {
        // Given
        let mockInfoDictionary: [String: Any] = [
            "CFBundleDisplayName": "NYT App",
            "CFBundleName": "NYT"
        ]
        let mockBundle = MockBundle(infoDictionary: mockInfoDictionary)
        
        // When
        let appName = mockBundle.applicationName
        
        // Then
        XCTAssertEqual(appName, "NYT App") // Debería preferir CFBundleDisplayName
    }
    
    func testApplicationName_WithNoNames() {
        // Given
        let mockInfoDictionary: [String: Any] = [:]
        let mockBundle = MockBundle(infoDictionary: mockInfoDictionary)
        
        // When
        let appName = mockBundle.applicationName
        
        // Then
        XCTAssertEqual(appName, "No Name Found")
    }
    
    
}


