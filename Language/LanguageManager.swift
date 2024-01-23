//
//  LanguageManager.swift
//  Language
//
//  Created by Pablo Alarcon on 1/22/24.
//

import Foundation

protocol LanguageObserver: AnyObject {
    func languageDidChange(to language: String)
}

class LanguageManager {
    static let shared = LanguageManager()
    
    static let languages = ["en", "es-419"]
    
    private var observers = NSHashTable<AnyObject>.weakObjects()
    
    var currentLanguage: String {
        get {
            UserDefaults.standard.string(forKey: "selectedLanguage") ?? "en"
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "selectedLanguage")
            notifyObservers()
        }
    }
    
    
    func attach(observer: LanguageObserver){
        observers.add(observer)
    }
    
    private func notifyObservers() {
        observers.allObjects.compactMap { $0 as? LanguageObserver }.forEach {
            $0.languageDidChange(to: currentLanguage)
        }
    }
}
