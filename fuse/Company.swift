//
//  Company.swift
//  fuse
//
//  Created by David Rodriguez Luque on 16/11/15.
//  Copyright © 2015 David Rodriguez Luque. All rights reserved.
//

import Foundation

class Company {
    
    var name = ""
    var logo = ""
    var customColor = "#FFFFFF"
    var passwordChangingEnable = false
    var passwordChangingSecureField: String? = nil
    
    init(values:  Dictionary<String, AnyObject>)
    {
        if let name = values["name"] as? String
        {
            self.name = name
        }
        if let logo = values["logo"] as? String
        {
            self.logo = logo
        }
        if let customColor = values["custom_color"] as? String
        {
            self.customColor = customColor
        }

        if let passwordChangingEnable = values["password_changing"]?["enabled"] as? Bool
        {
            self.passwordChangingEnable = passwordChangingEnable
        }
        if let passwordChangingSecureField = values["password_changing"]?["secure_field"] as? String
        {
            self.passwordChangingSecureField = passwordChangingSecureField
        }


   
    }
}