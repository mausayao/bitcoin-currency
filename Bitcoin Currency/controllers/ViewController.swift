//
//  ViewController.swift
//  Bitcoin Currency
//
//  Created by Maurício de Freitas Sayão on 19/05/19.
//  Copyright © 2019 Maurício de Freitas Sayão. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var currencyPickerView: UIPickerView!
    
     let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPickerView.delegate = self
        currencyPickerView.dataSource = self
    }
}

extension ViewController: UIPickerViewDataSource {
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(currencyArray[row])
    }
}
