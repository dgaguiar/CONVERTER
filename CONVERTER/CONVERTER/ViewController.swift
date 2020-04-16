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
    
    @IBAction func convertUnit(_ sender: Any) {
        if bntConvertLeft.alpha == 1.0 {
            bntConvertRight.alpha = 1.0
            bntConvertLeft.alpha = 0.5
        } else {
            bntConvertRight.alpha = 0.5
            bntConvertLeft.alpha = 1.0
        }
    }
    
    func convert()
    
    private func configScreen(title: String, leftButton: String, rightButton: String, color: UIColor) {
        titleUnit.text = title
        bntConvertLeft.setTitle(leftButton, for: .normal)
        bntConvertRight.setTitle(rightButton, for: .normal)
        viewTop.backgroundColor = color
        lbResultUnit.textColor = color
        lbResult.textColor = color
    }
    
    private func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
}

