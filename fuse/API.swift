//
//  File.swift
//  fuse
//
//  Created by David Rodriguez Luque on 16/11/15.
//  Copyright © 2015 David Rodriguez Luque. All rights reserved.
//

import Foundation

class API {
    
    var timeOut : NSTimeInterval = 30;
    var acceptableContentTypes = Set( ["application/json"])
    
    func getAFHTTPRequestOperationManager()-> AFHTTPRequestOperationManager
    {
        let manager = AFHTTPRequestOperationManager()
        manager.requestSerializer.timeoutInterval = self.timeOut
        manager.responseSerializer.acceptableContentTypes = self.acceptableContentTypes
        
        
        return manager
    }
    
    
    
    // MARK: - Validate Cpmpany NAme
    func validateCompanyName(name: String, success: (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) -> Void
        , failure:  (operation: AFHTTPRequestOperation?,error: NSError!) -> Void )
    {
        
        let manager = getAFHTTPRequestOperationManager()
        let URLString = "https://\(name).fusion-universal.com/api/v1/company.json"
        manager.GET(URLString,  parameters:nil,  success:success, failure:failure);
    }
    
    
}