// The Swift Programming Language
// https://docs.swift.org/swift-book

//
//  UrlManager.swift
//  unison
//
//  Created by Calogero Friscia on 11/01/26.
//

import UIKit

public final class PLUrlOpener {
    
    private let url: URL?
    
    public init(destination: PLUrlDestination) {
        self.url = destination.getUrl()
    }
    
    @MainActor public func open() {
        
        guard let url,
        UIApplication.shared.canOpenURL(url) else {
            
            // error
            return }
        
        UIApplication.shared.open(url)
        
    }

     public enum PLUrlDestination {
        
        case appSetting
        case custom(_ rawString: String)
        
         func getUrl() -> URL? {
            
            switch self {
            case .appSetting:
                return URL(string: UIApplication.openSettingsURLString)
            case .custom(let url):
                return URL(string: url)
                
            }
        }
    }
}
