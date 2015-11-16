//
//  ViewController.swift
//  fuse
//
//  Created by David Rodriguez Luque on 16/11/15.
//  Copyright © 2015 David Rodriguez Luque. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtCompanyName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func endEditingCompanyName(sender: UITextField) {
        
        let cleanName = txtCompanyName.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        if(cleanName?.characters.count == 0)
        {
           let alertController = UIAlertController(title: "Error", message:  "length of text should be more then 1", preferredStyle: .Alert)
           let ok = UIAlertAction(title: "OK", style: .Default, handler: { (UIAlertAction) -> Void in
                alertController.dismissViewControllerAnimated(true, completion: nil)
            })
           
            alertController.addAction(ok)
            
            self.presentViewController(alertController, animated:true, completion:nil);
           
        }
        else
        {
            let api = API();
            
            api.validateCompanyName(cleanName!, success: { (operation, responseObject) -> Void in
                
                
                if let dictCompany = responseObject as? Dictionary<String, AnyObject>
                {
                    let company = Company(values: dictCompany)
                    self.txtCompanyName.textColor = UIColor.greenColor()
                    self.txtCompanyName.text = company.name
                }
                else
                {
                    self.txtCompanyName.textColor = UIColor.redColor()
                }
                
                }) { (operation, error) -> Void in
                    
                    
                  self.txtCompanyName.textColor = UIColor.redColor()
            }
            
        }
    }
    
    @IBAction func exit(sender: AnyObject) {
        
       
    }

}

