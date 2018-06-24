//
//  Command.swift
//  CalculatorWatch Extension
//
//  Created by Jacob Lattie on 5/12/18.
//  Copyright © 2018 Jacob Lattie. All rights reserved.
//

import Foundation
import UIKit

enum CommandType {
    case Divide
    case Multiply
    case Subtract
    case Add
}

class Command: NSObject {
    var type: CommandType
    let oldValue: Double
    
    init(type: CommandType, oldValue: Double) {
        self.type = type
        self.oldValue = oldValue
        super.init()
    }
    
    func executeWithNewValue(newValue: Double) -> Double {
        var result = oldValue
        switch type {
        case .Divide: result /= newValue
        case .Multiply: result *= newValue
        case.Subtract: result -= newValue
        case.Add: result += newValue
        }
        return result
    }
}
