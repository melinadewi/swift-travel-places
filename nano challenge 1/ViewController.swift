//
//  ViewController.swift
//  nano challenge 1
//
//  Created by Melina Dewi on 05/03/20.
//  Copyright © 2020 Melina Dewi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    
    var pickerData: [String] = [String]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: pickerData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedPicker = pickerData[row]
        bgImage.image = UIImage(named: selectedPicker)
        if self.bgImage.frame.origin.x >= 0 {
            UIView.animate(withDuration: 10.0, animations: {
                self.bgImage.frame.origin.x -= 100
            })
        } else if self.bgImage.frame.origin.x <= -1000{
            UIView.animate(withDuration: 10.0, animations: {
                self.bgImage.frame.origin.x += 100
            })
        } else {
            UIView.animate(withDuration: 5.0, animations: {
                self.bgImage.frame.origin.x += 100
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = ["Singapore", "China", "Hong Kong", "Malaysia", "USA" ]
        

        UIView.animate(withDuration: 10.0, animations: {
            self.bgImage.frame.origin.x -= 100
        })
        
    }

    
    
}

