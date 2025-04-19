//
//  ApiErrorTests.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 17/04/25.
//


import XCTest
@testable import MostPopularArticlesNYT

final class ApiErrorTests: XCTestCase {
    
    func testApiError_DefaultError() {
        // Given
        let error = ApiError.defaultError
        
        // Then
        XCTAssertEqual(error.localizedDescription, "Error por defecto")
    }
    
    func testApiError_NoInternetConnection() {
        // Given
        let error = ApiError.noInternetConnection
        
        // Then
        XCTAssertEqual(error.localizedDescription, "Sin Conexion a Internet")
    }
    
    func testApiError_DontHaveResults() {
        // Given
        let error = ApiError.dontHaveResults
        
        // Then
        XCTAssertEqual(error.localizedDescription, "No se pudieron obtener resultados")
    }
    
    func testApiError_malFormattedJSON() {
        // Given
        let error = ApiError.malFormattedJSON
        
        // Then
        XCTAssertEqual(error.localizedDescription, "JSON con formato incorrecto")
    }
    
    func testApiError_InvalidURL() {
        // Given
        let error = ApiError.invalidURL
        
        // Then
        XCTAssertEqual(error.localizedDescription, "URL Invalida")
    }
    
   
} 
