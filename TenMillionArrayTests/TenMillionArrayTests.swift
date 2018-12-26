//
//  TenMillionArrayTests.swift
//  TenMillionArrayTests
//
//  Created by abuzeid on 12/25/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import XCTest
@testable import TenMillionArray

class TenMillionArrayTests: XCTestCase {
    let controller = ViewController()
    override func setUp() {
        print("log>\(#function)")
    }
    
    override func tearDown() {
        print("log>\(#function)")    }
    
    
    func testArrayHasMoreThanOneMillionItem(){
        XCTAssertEqual(controller.getGoldenUsers(from: oneMillion) .count, oneMillion)
    }
    func testPerformanceExample() {
        print("log>\(#function)")
        
        self.measure {
            let _ =  controller.selectRandomly(from: oneMillion, callback: {result in
                print(result)
            })gs
        }
    }
    
    
}
