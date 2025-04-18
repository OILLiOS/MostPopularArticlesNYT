//
//  RemotLoadImage+UIImageView.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 16/04/25.
//

import Foundation
import UIKit

//Protocolo que obtiene una imagen de una URL
protocol RemoteLoadImageProtocol {
    func loadFrom(url: URL, completion: @escaping (_ image: UIImage?) -> ())
}

final class ImageRemoteLoader: RemoteLoadImageProtocol{
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    /**
        Funcion que obtiene una imagen del servidor y regresa un`UIImage`
      - Parameters:
        - url: La URL de la .Imagen
        - completion:  Retorna un UIImage .
      - Returns: UIImage con la imagen descargada del servidor
    */
    func loadFrom(url: URL, completion: @escaping (UIImage?) -> ()) {
        DispatchQueue.global().async {
            let task = self.session.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    if let data = data, let image = UIImage(data: data) {
                        completion(image)
                    } else {
                        completion(nil)
                    }
                }
            }
            task.resume()
        }
    }
}

// Extension de UIImageView para cargar una imagen del servidor
extension UIImageView {
    func loadRemoteImage(url: URL, imageLoader: RemoteLoadImageProtocol = ImageRemoteLoader()){
        imageLoader.loadFrom(url: url) {[weak self] remotImage in
            self?.image = remotImage
        }
    }
}
