//
//  CalculatorBrain.swift
//  MVC
//
//  Created by Ngoc Hien on 1/16/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import SwiftUI

struct CalculatorBrain {
	var numberFormatter: NumberFormatter?
	private var accumulator: (value: Double?, description: String) = (nil, "") {
		didSet {
			print(accumulator.description)
		}
	}
	private func formatValue(_ number: Double) -> String {
		   if let formatter = numberFormatter {
			   return formatter.string(from: NSNumber(value: number))!
		   }
		   else {
			   return "\(number)"
		   }
	   }
	enum Operation {
		case binaryOperation((Double, Double) -> Double)
		case equals
	}
	private var operations: Dictionary <String, Operation> = [
		"+": Operation.binaryOperation({ $0 + $1 }),
		"-": Operation.binaryOperation({ $0 - $1 }),
		"x": Operation.binaryOperation({ $0 * $1 }),
		"/": Operation.binaryOperation({ $0 / $1 }),
		"=": Operation.equals
	]
	mutating func performOperation(_ symbol: String) {
		if let operation = operations[symbol] {
			switch operation {
			case .binaryOperation(let function):
				performPendingBinaryOperation()
				if accumulator.value != nil {
					pendingBinaryOperation = PendingBinaryOperation(function: function,
						firstOperand: accumulator.value!,
						description: "\(accumulator.description) \(symbol) ")
					accumulator = (nil, pendingBinaryOperation!.description)
				}
			case .equals:
				performPendingBinaryOperation()
			}

		}
	}
	private mutating func performPendingBinaryOperation() {
		if pendingBinaryOperation != nil && accumulator.value != nil {
			accumulator = (pendingBinaryOperation!.perform(with: accumulator.value!),
				pendingBinaryOperation!.description + "\(accumulator.description)")
			pendingBinaryOperation = nil
		}
	}
	private var pendingBinaryOperation: PendingBinaryOperation?

	var resultIsPending: Bool {
		get {
			return pendingBinaryOperation != nil
		}
	}

	private struct PendingBinaryOperation {
		let function: (Double, Double) -> Double
		let firstOperand: Double
		var description: String

		func perform(with secondOperand: Double) -> Double {
			return function(firstOperand, secondOperand)
		}
	}

	mutating func setOperand(_ operand: Double) {
		accumulator = (operand, formatValue(operand))
	}

	var result: (value: Double?, description: String) {
		get {
			
			let description = accumulator.description.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
			return (value: accumulator.value, description)
		}
	}

	mutating func reset() {
		accumulator = (nil, "")
		pendingBinaryOperation = nil
	}
}





