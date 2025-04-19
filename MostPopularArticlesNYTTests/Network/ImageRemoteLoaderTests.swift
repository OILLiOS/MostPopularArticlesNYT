//
//  ImageRemoteLoaderTests.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 17/04/25.
//

import XCTest
@testable import MostPopularArticlesNYT

final class ImageRemoteLoaderTests: XCTestCase {
    
    var sut: ImageRemoteLoader!
    var mockURLSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        mockURLSession = MockURLSession()
        sut = ImageRemoteLoader(session: mockURLSession)
    }
    
    override func tearDown() {
        sut = nil
        mockURLSession = nil
        super.tearDown()
    }
    
    func testLoadFrom_Success() {
        // Given
        let expectation = self.expectation(description: "Load image successfully")
        let mockImage = createMockImage(size: CGSize(width: 100, height: 100))
        let mockImageData = mockImage.pngData()!
        let mockURL = URL(string: "https://example.com/image.jpg")!
        mockURLSession.mockData = mockImageData
        
        // When
        sut.loadFrom(url: mockURL) { image in
            // Then
            XCTAssertNotNil(image)
            // Comparar los datos PNG
            XCTAssertEqual(image?.pngData()?.count, mockImageData.count)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0)
    }
    
    func testLoadFrom_Failure() {
        // Given
        let expectation = self.expectation(description: "Load image failure")
        let mockURL = URL(string: "https://invalid-url.com/image.jpg")!
        mockURLSession.mockError = NSError(domain: "TestError", code: 404, userInfo: nil)
        
        // When
        sut.loadFrom(url: mockURL) { image in
            // Then
            XCTAssertNil(image)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0)
    }
    
    func testLoadFrom_InvalidData() {
        // Given
        let expectation = self.expectation(description: "Load image with invalid data")
        let mockURL = URL(string: "https://example.com/invalid-image.jpg")!
        mockURLSession.mockData = Data([0, 1, 2, 3]) // Datos inválidos para una imagen
        
        // When
        sut.loadFrom(url: mockURL) { image in
            // Then
            XCTAssertNil(image)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0)
    }
    
    func testLoadFrom_EmptyData() {
        // Given
        let expectation = self.expectation(description: "Load image with empty data")
        let mockURL = URL(string: "https://example.com/empty-image.jpg")!
        mockURLSession.mockData = Data()
        
        // When
        sut.loadFrom(url: mockURL) { image in
            // Then
            XCTAssertNil(image)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0)
    }
    
    
    // MARK: - Helper Methods
    private func createMockImage(size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { context in
            UIColor.red.setFill()
            context.fill(CGRect(origin: .zero, size: size))
        }
    }
}


