//
//  APITest.swift
//  fuse
//
//  Created by David Rodriguez Luque on 16/11/15.
//  Copyright © 2015 David Rodriguez Luque. All rights reserved.
//

import XCTest
@testable import fuse

class APITest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

   
    func testValidateCompanyName(){
    
            let succesExpectation = self.expectationWithDescription("name")
    
            let api = API();
            
            api.validateCompanyName("home", success: { (operation, responseObject) -> Void in

                XCTAssertTrue(  responseObject != nil, "Error validateCompany name request`")
                
                
    
                succesExpectation.fulfill()
    
                }) { (operation, error) -> Void in
                    
                    let statusCode = operation!.response!.statusCode;
                    XCTAssertTrue(statusCode  == 404, "should return not found");
                    
                    succesExpectation.fulfill()
            }
            self.waitForExpectationsWithTimeout( 30) { (error: NSError?) -> Void in
                if((error) != nil)
                { XCTFail("Expectation Failed ValidateCompanyName reques with error, waitForExpectationsWithTimeout");}
            };
            
        }
    
    func testValidateCompanyNameFusion(){
        
        let succesExpectation = self.expectationWithDescription("name")
        
        let api = API();
        
        api.validateCompanyName("Fusion", success: { (operation, responseObject) -> Void in
            
            XCTAssertTrue(  responseObject != nil, "Error, response should not be nill validateCompany name request`")
            
            let dictCompany = responseObject as? Dictionary<String, AnyObject>
            XCTAssertTrue(  dictCompany != nil, "response should be a dictionary validateCompany name request`")

            let company = Company(values: dictCompany!)
             XCTAssertTrue(  company.name == "Fuse", "response should be a dictionary validateCompany name request`")
            
            
            succesExpectation.fulfill()
            
            }) { (operation, error) -> Void in
                
               
                XCTFail("operation error, should found Fusion");
                
                succesExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout( 30) { (error: NSError?) -> Void in
            if((error) != nil)
            { XCTFail("Expectation Failed ValidateCompanyName reques with error, waitForExpectationsWithTimeout");}
        };
        
    }
    
 

}
