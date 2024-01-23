//
//  ViewController.swift
//  Language
//
//  Created by Pablo Alarcon on 1/22/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    
    private struct StringKeys {
        static let helloWorld = "hello_world"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        helloLabel.text = StringKeys.helloWorld.localized()
        LanguageManager.shared.attach(observer: self)
        // Do any additional setup after loading the view.
    }


}

extension FirstViewController: LanguageObserver {
    func languageDidChange(to language: String) {
        helloLabel.text = StringKeys.helloWorld.localized()
    }
    
}
