//
//  Extension+String.swift
//  Language
//
//  Created by Pablo Alarcon on 1/22/24.
//

import Foundation

extension String {
    func localized() -> String {
        guard let path = Bundle.main.path(forResource: LanguageManager.shared.currentLanguage, ofType: "lproj"), let bundle = Bundle(path: path) else {
            return self
        }
        
        return bundle.localizedString(forKey: self, value: nil, table: nil)
    }
}
