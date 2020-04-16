//
//  ViewController.swift
//  CONVERTER
//
//  Created by daianne.gomes.aguiar on 15/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var titleUnit: UILabel!
    @IBOutlet weak var bntConvertLeft: UIButton!
    @IBOutlet weak var bntConvertRight: UIButton!
    @IBOutlet weak var tfValue: UITextField!
    
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dismissKeyboard()
    }
    
    @IBAction func nextUnit(_ sender: Any) {
        switch titleUnit.text {
        case Units.temperature:
            configScreen(title: Units.weight, leftButton: Units.kilograma, rightButton: Units.libra, color: UIColor.orange)
        case Units.weight:
            configScreen(title: Units.currency, leftButton: Units.real, rightButton: Units.dolar, color: UIColor.purple)
        case Units.currency:
            configScreen(title: Units.distance, leftButton: Units.meters, rightButton: Units.kilometro, color: UIColor.systemRed)
        default:
            configScreen(title: Units.temperature, leftButton: Units.celsius, rightButton: Units.fareinheit, color: UIColor.systemBlue)
        }
    }
    
    @IBAction func convertUnit(_ sender: UIButton?) {
        if let sender = sender {
            if sender == bntConvertLeft {
                bntConvertRight.alpha = 0.5
            } else {
                bntConvertLeft.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        whitchUnitConvert()
        
        let result = Double(lbResult.text!)!
        lbResult.text = String(format: "%.2f", result)
        
        view.endEditing(true)
    }
    
    func whitchUnitConvert() {
        switch titleUnit.text {
        case Units.temperature:
            calculateTemperature()
        case Units.weight:
            calculateWeight()
        case Units.currency:
            calculateCurrency()
        default:
            calculateDistance()
        }
    }
    
    func calculateTemperature() {
        guard let temperature = Double(tfValue.text!) else {return}
        if bntConvertRight.alpha == 1.0 {
            lbResultUnit.text = Units.celsius
            lbResult.text = String((temperature - 32) / 1.8)
        } else {
            lbResultUnit.text = Units.fareinheit
            lbResult.text = String(temperature * 1.8 + 32)
        }
    }
    
    func calculateWeight() {
        guard let weight = Double(tfValue.text!) else {return}
        if bntConvertRight.alpha == 1.0 {
            lbResultUnit.text = Units.kilograma
            lbResult.text = String(weight / 2.20462)
        } else {
            lbResultUnit.text = Units.libra
            lbResult.text = String(weight * 2.20462)
        }
    }
    
    func calculateCurrency() {
        guard let currency = Double(tfValue.text!) else {return}
        if bntConvertRight.alpha == 1.0 {
            lbResultUnit.text = Units.real
            lbResult.text = String(currency * 4.8)
        } else {
            lbResultUnit.text = Units.dolar
            lbResult.text = String(currency / 4.8)
        }
    }
    
    func calculateDistance() {
        guard let distance = Double(tfValue.text!) else {return}
        if bntConvertRight.alpha == 1.0 {
            lbResultUnit.text = Units.meters
            lbResult.text = String(distance * 1000)
        } else {
            lbResultUnit.text = Units.kilometro
            lbResult.text = String(distance / 1000)
        }
    }
    
    private func configScreen(title: String, leftButton: String, rightButton: String, color: UIColor) {
        titleUnit.text = title
        bntConvertLeft.setTitle(leftButton, for: .normal)
        bntConvertRight.setTitle(rightButton, for: .normal)
        viewTop.backgroundColor = color
        lbResultUnit.textColor = color
        lbResult.textColor = color
        lbResult.text = "0"
        lbResultUnit.text = ""
    }
    
    private func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
}

