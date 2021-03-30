//
//  CalculatorViewController.swift
//  CalculatorTests
//
//
//  Created by prog_zidane on 3/30/21.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var zeroBtn: UIButton!
    @IBOutlet var oneBtn: UIButton!
    @IBOutlet var twoBtn: UIButton!
    @IBOutlet var threeBtn: UIButton!
    @IBOutlet var fourBtn: UIButton!
    @IBOutlet var fiveBtn: UIButton!
    @IBOutlet var sixBtn: UIButton!
    @IBOutlet var sevenBtn: UIButton!
    @IBOutlet var eightBtn: UIButton!
    @IBOutlet var nineBtn: UIButton!
    @IBOutlet var decimalBtn: UIButton!
    @IBOutlet var equalsBtn: UIButton!
    @IBOutlet var addBtn: UIButton!
    @IBOutlet var subtractBtn: UIButton!
    @IBOutlet var multiplyBtn: UIButton!
    @IBOutlet var divideBtn: UIButton!
    @IBOutlet var acBtn: UIButton!
    
    var calculationManager: CalculationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        calculationManager = CalculationManager()
    }
    
    @IBAction func numberBtnWasPressed(_ sender: UIButton) {
        calculationManager.append(sender.tag)
        self.valueLabel.text = calculationManager.stringifyValues()
    }
    
    @IBAction func acButtonWasPressed(_ sender: UIButton) {
        self.valueLabel.text = calculationManager.clear()
    }
    
    @IBAction func operandBtnWasPressed(_ sender: UIButton) {
        guard let operand = Operand(rawValue: sender.tag) else { return }
        calculationManager.set(operand: operand)
    }
    
    @IBAction func equalsBtnWasPressed(_ sender: UIButton) {
        let calculationString = String(describing: calculationManager.calculate())
        self.valueLabel.text = calculationString
    }
}
