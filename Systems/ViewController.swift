//
//  ViewController.swift
//  Systems
//
//  Created by Boris Dipner on 2/27/20.
//  Copyright © 2020 Boris Dipner. All rights reserved.
//

import Cocoa

class ViewController: NSViewController{
    
    // MARK: Properties defenition
    var systems = ["Binary", "Trinity", "Fivefold", "Octal", "Decimal", "Hexadecimal"]
    var firstSystem = 0
    var secondSystem = 0
    
    // MARK: IBOutlets defenition
    @IBOutlet weak var starterNSComboBox: NSComboBox!
    @IBOutlet weak var finalNSComboBox: NSComboBox!
    @IBOutlet weak var startNSTextField: NSTextField!
    @IBOutlet weak var finalNSTextField: NSTextField!
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: IBActions defenition
    @IBAction func convertActionButton(_ sender: Any) {
        
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
        
        if firstNumber == ""{
            startNSTextField.stringValue = ""
            finalNSTextField.stringValue = ""
            showOkDialogWindow(question: "Warning !", text: "Input field is empty, pls enter number ypu want to convert!")
        } else if firstSystem == secondSystem {
            startNSTextField.stringValue = ""
            finalNSTextField.stringValue = ""
            showOkDialogWindow(question: "Warning !", text: "Are you trying convert number from \(systems[starterNSComboBox.indexOfSelectedItem]) to \(systems[starterNSComboBox.indexOfSelectedItem])? Why? :)")
            
        } else if let firstNumber = Int(firstNumber, radix: firstSystem){
            finalNSTextField.stringValue = String(firstNumber, radix:secondSystem)
        } else {
            startNSTextField.stringValue = ""
            finalNSTextField.stringValue = ""
            if firstSystem == 16{
                showOkDialogWindow(question: "Warning !", text: "\(systems[starterNSComboBox.indexOfSelectedItem]) system contains numbers only from 0 to \(firstSystem-1) and letters A B C D F")
            }
            else{
                showOkDialogWindow(question: "Warning !", text: "\(systems[starterNSComboBox.indexOfSelectedItem]) system contains numbers only from 0 to \(firstSystem-1)")
            }
        }
    }
}

// MARK: Private
private extension ViewController {
    
    func showOkDialogWindow(question: String, text: String) {
        let alert = NSAlert()
        alert.messageText = question
        alert.informativeText = text
        alert.alertStyle = .informational
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
    
    func configure(){
        self.starterNSComboBox.usesDataSource = true
        self.starterNSComboBox.delegate = self
        self.starterNSComboBox.dataSource = self
        self.starterNSComboBox.addItems(withObjectValues: systems)
        
        self.finalNSComboBox.usesDataSource = true
        self.finalNSComboBox.delegate = self
        self.finalNSComboBox.dataSource = self
        self.finalNSComboBox.addItems(withObjectValues: systems)
    }
}

// MARK: NSComboBoxDelegate
extension ViewController: NSComboBoxDataSource, NSComboBoxDelegate{
    
    func numberOfItems(in comboBox: NSComboBox) -> Int {
        return systems.count
    }
    
    func comboBox(_ comboBox: NSComboBox, objectValueForItemAt index: Int) -> Any? {
        return systems[index]
    }
}

