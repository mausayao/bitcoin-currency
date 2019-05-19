//
//  ViewController.swift
//  Bitcoin Currency
//
//  Created by Maurício de Freitas Sayão on 19/05/19.
//  Copyright © 2019 Maurício de Freitas Sayão. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var currencyPickerView: UIPickerView!
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    let symbols = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPickerView.delegate = self
        currencyPickerView.dataSource = self
        getCurrency(url: "\(baseURL)\(currencyArray[0])", symbol: symbols[0])
    }
    
    func updateLabel(value: String) {
        priceLabel.text = value
    }
    
    func getCurrency(url: String, symbol: String) {
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if response.result.isSuccess {
                let data: JSON = JSON(response.result.value!)
                if let value = data["ask"].double {
                    self.updateLabel(value: "\(symbol) \(value)")
                } else {
                    self.updateLabel(value: "Erro to obtain value!")
                }
                
            }else {
                self .updateLabel(value: "Connection Error!")
            }
        }
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
        let url = baseURL+currencyArray[row]
        let symbol = symbols[row]
        getCurrency(url: url, symbol: symbol)
    }
}
