//
//  ApiError.swift
//  NYTOILL
//
//  Created by Octavio Labastida Luna on 16/04/25.
//

import Foundation

///Tipos de errores para el consumo del Api NYT
public enum ApiError: Error {
    ///Error generico del Api
    case defaultError
    case invalidURL
    case noInternetConnection
    case malFormattedJSON
    /**
     Descripcion del error del Api Movie DB
     - Returns: Regresa un 'String' con la descripcion del error provocado
     */
    var localizedDescription: String {
        switch self {
        case .defaultError:
            return "Error por defecto"
        case .invalidURL:
            return "URL Invalida"
        case .noInternetConnection:
            return "Sin Conexion a Internet"
        case .malFormattedJSON:
            return  "JSON con formato incorrecto"
        }
    }
}
