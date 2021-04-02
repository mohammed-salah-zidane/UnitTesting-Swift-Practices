//
//  CalculatorViewControllerTests.swift
//  CalculatorTestsTests
//
//  Created by prog_zidane on 4/2/21.
//

import XCTest
@testable import CalculatorTests

class CalculatorViewControllerTests: XCTestCase {

    var systemUnderTest: CalculatorViewController!
    override func setUp() {
        super.setUp()
        instantiateTheSystem()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func instantiateTheSystem() {
        let storybaord = UIStoryboard(name: "Main", bundle: nil)
        systemUnderTest = storybaord.instantiateViewController(withIdentifier: "CalculatorViewController") as? CalculatorViewController
        systemUnderTest.loadViewIfNeeded()
    }
    
    func testAddValue_ShouldUpdateLabel() {
        systemUnderTest.oneBtn.sendActions(for: .touchUpInside)
        systemUnderTest.twoBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(systemUnderTest.valueLabel.text, "12")
    }
    
    func testEqualButton_ShouldPerformCalculationAndUpdateLabel() {
        systemUnderTest.fiveBtn.sendActions(for: .touchUpInside)
        systemUnderTest.multiplyBtn.sendActions(for: .touchUpInside)
        systemUnderTest.oneBtn.sendActions(for: .touchUpInside)
        systemUnderTest.equalsBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(systemUnderTest.valueLabel.text, "5")
    }
    
    func testOperandButton_ShouldChangeOperandWhenTapped() {
        systemUnderTest.fiveBtn.sendActions(for: .touchUpInside)
        systemUnderTest.multiplyBtn.sendActions(for: .touchUpInside)
        systemUnderTest.addBtn.sendActions(for: .touchUpInside)
        systemUnderTest.subtractBtn.sendActions(for: .touchUpInside)
        systemUnderTest.oneBtn.sendActions(for: .touchUpInside)
        systemUnderTest.equalsBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(systemUnderTest.valueLabel.text, "4")
    }
    
    func testClearButton_ShouldClearLabel() {
        systemUnderTest.fiveBtn.sendActions(for: .touchUpInside)
        systemUnderTest.oneBtn.sendActions(for: .touchUpInside)
        systemUnderTest.acBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(systemUnderTest.valueLabel.text, "0")
    }
}
