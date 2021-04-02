//
//  PhotoViewContollerTests.swift
//  photolodeTests
//
//  Created by prog_zidane on 4/2/21.
//  Copyright © 2021 Caleb Stultz. All rights reserved.
//

import XCTest
@testable import photolode
class PhotoViewContollerTests: XCTestCase {

    var systemUnderTest: PhotoViewController!
    override func setUp() {
        super.setUp()
        instantiateTheSystem()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func instantiateTheSystem() {
        let storybaord = UIStoryboard(name: "Main", bundle: nil)
        systemUnderTest = storybaord.instantiateViewController(withIdentifier: "PhotoViewController") as? PhotoViewController
        systemUnderTest.loadViewIfNeeded()
    }

    
    func testDownloadPhoto_ImageOriantationShouldBeIdentical() {
        let expectedOriantation = UIImage(named: "pexels-photo-768218")?.imageOrientation
        guard let url = URL(string:imageURLStrings[3]) else { XCTFail(); return }
        let sessionAnsweredExpectation = expectation(description: "Session")
        
        URLSession.shared.dataTask(with: url) { date, response, error in
            if let error = error {
                XCTFail(error.localizedDescription)
            }
            
            if let date = date {
                guard let image = UIImage(data: date) else { XCTFail(); return }
                sessionAnsweredExpectation.fulfill()
                XCTAssertEqual(image.imageOrientation, expectedOriantation)
            }
        }.resume()
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
}
