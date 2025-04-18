//
//  NetworkConnectionManager.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 17/04/25.
//

import Foundation


class NetworkConnectionManager {
    
    // MARK: Static properties
    public static let sharedInstance: NetworkConnectionManager = {
        let instance = NetworkConnectionManager()
        return instance
    }()
    // MARK: properties
    var reachabilityStatus: Reachability.Connection = .unavailable
    let reachability = try! Reachability()
    var haveConnection : Bool = false
    
    // MARK: Initializers
    init() { }

    func startObserveConnection() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do {
            try reachability.startNotifier()
        } catch(let error) {
                print("No se pudo inicializar el observador \(error.localizedDescription)")
        }
    }

    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability
        switch reachability.connection {
        case .wifi, .cellular:
            self.haveConnection = true
        case .unavailable:
            self.haveConnection = false
        }
     }
    
    func phoneHaveConnection() -> Bool{
        return self.haveConnection
    }
}
