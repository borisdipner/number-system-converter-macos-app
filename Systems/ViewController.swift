//
//  ViewController.swift
//  Systems
//
//  Created by Boris Dipner on 2/27/20.
//  Copyright © 2020 Boris Dipner. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSComboBoxDataSource, NSComboBoxDelegate, NSControlTextEditingDelegate{
    var systems = ["Двоичная", "Троичная", "Пятеричная", "Восьмеричная", "Десятичная", "Шестнадцатиричная"]

    @IBOutlet weak var starterNSComboBox: NSComboBox!
    @IBOutlet weak var finalNSComboBox: NSComboBox!
    @IBOutlet weak var startNSTextField: NSTextField!
    @IBOutlet weak var finalNSTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.starterNSComboBox.usesDataSource = true
        self.starterNSComboBox.delegate = self
        self.starterNSComboBox.dataSource = self
        
        self.finalNSComboBox.usesDataSource = true
        self.finalNSComboBox.delegate = self
        self.finalNSComboBox.dataSource = self
        self.starterNSComboBox.addItems(withObjectValues: systems)
    }
    
    override var representedObject: Any? {
        didSet {
        }
    }
    
    func numberOfItems(in comboBox: NSComboBox) -> Int {
        // anArray is an Array variable containing the objects
        return systems.count
    }
    
    // Returns the object that corresponds to the item at the specified index in the combo box
    func comboBox(_ comboBox: NSComboBox, objectValueForItemAt index: Int) -> Any? {
        return systems[index]
    }
    
    
    @IBAction func convertActionButton(_ sender: Any) {
        
        var firstSystem = 0
        switch starterNSComboBox.indexOfSelectedItem {
        case 1:
            firstSystem = 3
        case 2:
            firstSystem = 5
        case 3:
            firstSystem = 8
        case 4:
            firstSystem = 10
        case 5:
            firstSystem = 16
        default:
            firstSystem = 2
        }
        
        var secondSystem = 0
        switch finalNSComboBox.indexOfSelectedItem {
        case 1:
            secondSystem = 3
        case 2:
            secondSystem = 5
        case 3:
            secondSystem = 8
        case 4:
            secondSystem = 10
        case 5:
            secondSystem = 16
        default:
            secondSystem = 2
        }
        
        let firstNumber = startNSTextField.stringValue
        
        if let firstNumber = Int(firstNumber, radix: firstSystem){
            let result = String(firstNumber, radix:secondSystem)
            finalNSTextField.stringValue = result
        } else{
            
            finalNSTextField.stringValue = ""

            dialogOKCancel(question: "Ошибка !", text: "Возможные причины:\n1. Неправильное число \n2. Пустое поле \n3. Этого числа нет в выбраной системе")
        }
    }
    
    func dialogOKCancel(question: String, text: String) {
        let alert = NSAlert()
        alert.messageText = question
        alert.informativeText = text
        alert.alertStyle = .critical
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }

}
