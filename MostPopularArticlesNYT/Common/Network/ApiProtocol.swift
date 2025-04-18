//
//  ApiProtocol.swift
//  NYTOILL
//
//  Created by Octavio Labastida Luna on 16/04/25.
//

import Foundation

///Protocolo para implementar una llamada al Api NYT
protocol GenericAPIProtocol {
    var apiError: ApiError? { get }
    func fetch<T: Decodable>(ApiURLRequest: URLRequest?, completionHandler: @escaping (Result<T?, Error>) -> Void)
    func decode<T: Decodable>(data: Data?, decoder: JSONDecoder) -> T?
}

extension GenericAPIProtocol {
    /// Este método obtiene la respuesta del servidor
    /// - parameters:
    ///    - request: Request  a consumir
    /// - returns:
    ///   Devuelve un Result con <Modelo, error>
    
    func fetch<T: Decodable>(ApiURLRequest: URLRequest?, completionHandler: @escaping (Result<T?, Error>) -> Void) {
        guard let url = ApiURLRequest else {
            completionHandler(.failure(ApiError.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let decodedResponse: T = self.decode(data: data) {
                DispatchQueue.main.async {
                    completionHandler(.success(decodedResponse))
                }
            }else{
                completionHandler(.failure(ApiError.malFormattedJSON))
            }
        }.resume()
    }
    
    /// Este método realiza la decodificación de data
    /// - parameters:
    ///    - data: información a decodificar
    ///    -  decoder: instancia de JSONDecoder
    /// - returns:
    ///     - retorna el objeto decodificado
    func decode<T: Decodable>(data: Data?, decoder: JSONDecoder = JSONDecoder()) -> T? {
        return try? decoder.decode(T.self, from: data ?? Data())
    }
}
