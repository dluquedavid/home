//
//  Model.swift
//  fuse
//
//  Created by David Rodriguez Luque on 16/11/15.
//  Copyright © 2015 David Rodriguez Luque. All rights reserved.
//


import XCTest
@testable import fuse

class ModelTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testCreatModel(){
        
        let name = "Fusion"
        let logo = "http://www.logo.com/logo.png"
        let customColor = "#FFFFFF"
        let enable = false
        let secureField = "1234"
        let values = ["name": name, "logo": logo, "custom_color": customColor, "password_changing":["enabled":enable, "secure_field": secureField]];
        let company = Company(values: values as! Dictionary<String, AnyObject>)
        
        XCTAssertTrue(  company.name == name, "error seting name in company init `")
        XCTAssertTrue(  company.logo == logo, "error seting logo in company init `")
        XCTAssertTrue(  company.customColor == customColor, "error seting customColor in company init `")
        XCTAssertTrue(  company.passwordChangingEnable == enable, "error seting enable in company init `")
        XCTAssertTrue(  company.passwordChangingSecureField == secureField, "error seting secureField in company init `")
        
        
    }
    
    
}
