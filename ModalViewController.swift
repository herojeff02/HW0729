//
//  ModalViewController.swift
//  HW0729
//
//  Created by herojeff on 30/07/2018.
//  Copyright © 2018 herojeff. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    @IBAction func dismissButton(_ sender: Any) {
        
        view.endEditing(true)
        
        let str = inputField.text ?? "No Input"
        let newTitleString:[String: String] = ["str": str]
        
        // post a notification
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationName"), object: nil, userInfo: newTitleString)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // `default` is now a property, not a method call
        
        // Register to receive notification in your class
        
        
        // handle notification
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
