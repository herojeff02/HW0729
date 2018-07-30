//
//  SubViewController.swift
//  HW0729
//
//  Created by 조준오 on 2018/07/30.
//  Copyright © 2018 herojeff. All rights reserved.
//

import UIKit

protocol ReceiveDelegate {
    func receiveData(data:String)
}

class SubViewController: UIViewController, SendDelegate {
    var cellName: String?
    func sendData(data: String) {
        cellName! = data
        print(data)
    }

    var delegate: ReceiveDelegate? = nil
    
    @IBOutlet weak var textField: UITextField!
    @IBAction func saveButton(_ sender: Any) {
        if let inputText = textField.text {
            delegate!.receiveData(data: inputText)
            self.navigationItem.title = inputText
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = cellName
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController: MainViewController = segue.destination as! MainViewController
        viewController.delegate = self
    }

}
