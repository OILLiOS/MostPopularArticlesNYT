//
//  Bundle+Extension.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 17/04/25.
//
import Foundation

extension Bundle {
    var applicationName: String {
        if let displayName: String = self.infoDictionary?["CFBundleDisplayName"] as? String {
            return displayName
        } else if let name: String = self.infoDictionary?["CFBundleName"] as? String {
            return name
        }
        return "No Name Found"
    }
}
