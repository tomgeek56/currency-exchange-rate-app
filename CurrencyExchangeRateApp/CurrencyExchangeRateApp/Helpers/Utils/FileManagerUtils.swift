//
//  FileManagerUtils.swift
//  CurrencyExchangeRateApp
//
//  Created by GeeksDeck on 04/10/2020.
//  Copyright © 2020 Tomasz Cegiełka. All rights reserved.
//

import Foundation

extension FileManager {
    
    static func readFileContent(for fileName: String, fileExtension: String) -> Data? {
        
        let bundle = Bundle.main
        if let path = bundle.path(forResource: fileName, ofType: fileExtension) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                
            }
        }
        
        return nil
    }
}
