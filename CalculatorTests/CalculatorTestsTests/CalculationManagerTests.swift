//
//  CalculatorTestsTests.swift
//  CalculatorTestsTests
//
//  Created by prog_zidane on 3/30/21.
//

import XCTest
@testable import CalculatorTests

class CalculationManagerTests: XCTestCase {
    
    var calcManager: CalculationManager!
        
    override func setUp() {
        super.setUp()
        calcManager = CalculationManager()
    }

    override func tearDown() {
        calcManager = nil
        super.tearDown()
    }
    
    func testInit_Values() {
        let calcManager = CalculationManager(valueA: 10, valueB: 20, currentOperand: .add, valueEntryArray: [])
        XCTAssertEqual(calcManager.valueA, 10)
        XCTAssertEqual(calcManager.valueB, 20)
        XCTAssertNotNil(calcManager.currentOperand)
    }
    
    func testValues_AreInitailyZero() {
        XCTAssertEqual(calcManager.valueA, 0)
        XCTAssertEqual(calcManager.valueB, 0)
    }
    
    func testOperand_IsInitailyNil() {
        XCTAssertNil(calcManager.currentOperand, "Operand should be nil")
    }
    
    func testClear_WhenCallClearValues() {
        calcManager.insert(value: 10)
        calcManager.insert(value: 10)
        calcManager.currentOperand = .add
        calcManager.clear()
        XCTAssertEqual(calcManager.valueA, 0)
        XCTAssertEqual(calcManager.valueB, 0)
        XCTAssertNil(calcManager.currentOperand, "Operand should be nil")
        XCTAssertEqual(calcManager.valueEntryArray, [])
    }
    
    func testAdd_TwoValues() {
        calcManager.set(operand: .add)
        XCTAssertNotNil(calcManager.currentOperand)
        calcManager.insert(value: 10)
        XCTAssertEqual(calcManager.valueA, 10)
        calcManager.insert(value: 20)
        XCTAssertEqual(calcManager.valueB, 20)
        XCTAssertEqual(calcManager.calculate(), 30)
    }
    
    func testSubtraction_TwoValues() {
        calcManager.set(operand: .subtract)
        XCTAssertNotNil(calcManager.currentOperand)
        calcManager.insert(value: 20)
        XCTAssertEqual(calcManager.valueA, 20)
        calcManager.insert(value: 10)
        XCTAssertEqual(calcManager.valueB, 10)
        XCTAssertEqual(calcManager.calculate(), 10)
    }
    
    func testMultiply_TwoValues() {
        calcManager.set(operand: .multiply)
        XCTAssertNotNil(calcManager.currentOperand)
        calcManager.insert(value: 20)
        XCTAssertEqual(calcManager.valueA, 20)
        calcManager.insert(value: 10)
        XCTAssertEqual(calcManager.valueB, 10)
        XCTAssertEqual(calcManager.calculate(), 200)
    }
    
    func testDivision_TwoValues() {
        calcManager.set(operand: .divide)
        XCTAssertNotNil(calcManager.currentOperand)
        calcManager.insert(value: 20)
        XCTAssertEqual(calcManager.valueA, 20)
        calcManager.insert(value: 10)
        XCTAssertEqual(calcManager.valueB, 10)
        XCTAssertEqual(calcManager.calculate(), 2)
    }
    
    
    func testAppendValues_TwoValues() {
        calcManager.set(operand: .divide)
        XCTAssertNotNil(calcManager.currentOperand)
        calcManager.append(2)
        calcManager.append(0)
        XCTAssertEqual(calcManager.stringifyValues(), "20")
    }
    
    
}
