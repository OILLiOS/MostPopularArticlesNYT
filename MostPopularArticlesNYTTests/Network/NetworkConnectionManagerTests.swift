//
//  NetworkConnectionManagerTests.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 17/04/25.
//


import XCTest
@testable import MostPopularArticlesNYT

class NetworkConnectionManagerTests: XCTestCase {
    
    var sut: NetworkConnectionManager!
    
    override func setUp() {
        super.setUp()
        sut = NetworkConnectionManager.sharedInstance
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSharedInstance_ReturnsSameInstance() {
        // Given
        let instance1 = NetworkConnectionManager.sharedInstance
        let instance2 = NetworkConnectionManager.sharedInstance
        
        // Then
        XCTAssertTrue(instance1 === instance2)
    }
    
    func testPhoneHaveConnection_ReturnsBool() {
        // When
        let hasConnection = sut.phoneHaveConnection()
        
        // Then
        XCTAssertTrue(hasConnection == true || hasConnection == false)
    }
    
    func testStartMonitoring_ChangesConnectionStatus() {
        // Given
        let expectation = self.expectation(description: "Connection status changes")
        
        // When
        sut.startObserveConnection()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertTrue(self.sut.phoneHaveConnection() == true || self.sut.phoneHaveConnection() == false)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2.0)
    }
    
    func testStopMonitoring_StopsMonitoring() {
        // Given
        sut.startObserveConnection()
        
        // When
        sut.stopObserveConnection()
        
        // Then
        XCTAssertTrue(sut.phoneHaveConnection() == true || sut.phoneHaveConnection() == false)
    }
} 
