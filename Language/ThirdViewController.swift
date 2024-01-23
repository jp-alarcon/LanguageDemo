//
//  ThirdViewController.swift
//  Language
//
//  Created by Pablo Alarcon on 1/22/24.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var languagePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        languagePicker.delegate = self
        languagePicker.dataSource = self
        languagePicker.selectRow(LanguageManager.languages.firstIndex(of: LanguageManager.shared.currentLanguage) ?? 0, inComponent: 0, animated: false)
        // Do any additional setup after loading the view.
        
    }

}

extension ThirdViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        LanguageManager.languages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        LanguageManager.languages[row].localized()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        LanguageManager.shared.currentLanguage = LanguageManager.languages[row]
    }
    
    
}

