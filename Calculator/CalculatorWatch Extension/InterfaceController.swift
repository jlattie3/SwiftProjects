//
//  InterfaceController.swift
//  CalculatorWatch Extension
//
//  Created by Jacob Lattie on 5/12/18.
//  Copyright © 2018 Jacob Lattie. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    var currentValue: String = "0"
    var calculationExectued = false
    var command: Command?

    @IBAction func button0Tapped() {
        print("Button 0")
        numberPressed(value: 0)
    }
    @IBAction func button1Tapped() {
        print("Button 1")
        numberPressed(value: 1)
    }
    @IBAction func button2Tapped() {
        print("Button 2")
        numberPressed(value: 2)
    }
    @IBAction func button3Tapped() {
        print("Button 3")
        numberPressed(value: 3)
    }
    @IBAction func button4Tapped() {
        print("Button 4")
        numberPressed(value: 4)
    }
    @IBAction func button5Tapped() {
        print("Button 5")
        numberPressed(value: 5)
    }
    @IBAction func button6Tapped() {
        print("Button 6")
        numberPressed(value: 6)
    }
    @IBAction func button7Tapped() {
        print("Button 7")
        numberPressed(value: 7)
    }
    @IBAction func button8Tapped() {
        print("Button 8")
        numberPressed(value: 8)
    }
    @IBAction func button9Tapped() {
        print("Button 9")
        numberPressed(value: 9)
    }
    @IBAction func clearTapped() {
        command = nil
        currentValue = "0"
        displayLabel.setText(currentValue)
    }
    @IBAction func decimalTapped() {
        if !currentValue.contains(".") {
            currentValue += "."
            displayLabel.setText(currentValue)
        }
    }
    @IBOutlet var displayLabel: WKInterfaceLabel!
    @IBOutlet var divideButton: WKInterfaceButton!
    @IBAction func divideTapped() {
        setCommandBG()
        divideButton.setBackgroundColor(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))
        commandTapped(type: .Divide)
    }
    @IBOutlet var multiplyButton: WKInterfaceButton!
    @IBAction func multiplyTapped() {
        setCommandBG()
        multiplyButton.setBackgroundColor(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))
        commandTapped(type: .Multiply)
    }
    @IBOutlet var subtractButton: WKInterfaceButton!
    @IBAction func subtractTapped() {
        setCommandBG()
        subtractButton.setBackgroundColor(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))
        commandTapped(type: .Subtract)
    }
    @IBOutlet var addButton: WKInterfaceButton!
    @IBAction func addTapped() {
        setCommandBG()
        addButton.setBackgroundColor(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))
        commandTapped(type: .Add)
    }
    
    func numberPressed(value: Int) {
        setCommandBG()
        let newValue = "\(value)"
        if currentValue == "0" || calculationExectued {
            calculationExectued = false
            currentValue = newValue
        } else {
            currentValue += newValue
        }
        displayLabel.setText(currentValue)
    }
    func setCommandBG() {
        divideButton.setBackgroundColor(#colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1))
        multiplyButton.setBackgroundColor(#colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1))
        subtractButton.setBackgroundColor(#colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1))
        addButton.setBackgroundColor(#colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1))
    }
    func commandTapped(type: CommandType) {
        if command != nil {
            command!.type = type
        } else {
            command = Command(type: type, oldValue: (currentValue as NSString).doubleValue)
            currentValue = "0"
        }
    }
    func setDisplayValue(value: Double) {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            currentValue = "\(Int(value))"
        } else {
            currentValue = "\(value)"
        }
        displayLabel.setText(currentValue)
    }
    @IBAction func answerTapped() {
        if command != nil {
            let answer = command!.executeWithNewValue(newValue: (currentValue as NSString).doubleValue)
            setDisplayValue(value: answer)
            command = nil
            calculationExectued = true
        }
    }
    
}
