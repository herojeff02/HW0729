//
//  MainViewController.swift
//  HW0729
//
//  Created by 조준오 on 2018/07/30.
//  Copyright © 2018 herojeff. All rights reserved.
//

import UIKit

protocol SendDelegate {
    func sendData(data:String)
}

struct CellContent {
    var title:String
    var desc:String
}

class MainViewController: UITableViewController, ReceiveDelegate {
    
    var delegate:SendDelegate? = nil
    var cellContentTemp:String? = nil
    var newCellTitle:String? = nil
    var currentCell:Int? = nil
    var cellContent:String? = nil
    var vc:SubViewController? = nil
    
    @IBOutlet var table1: UITableView!
    
    func receiveData(data: String) {
        newCellTitle = data
        array[currentCell!].title = newCellTitle as! String
        table1.reloadData()
    }
    
    var array: [CellContent] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in (1...20) {
            array.append(CellContent(title: String(i), desc: String(i) + "desc"))
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.showSpinningWheel(_:)), name: NSNotification.Name(rawValue: "notificationName"), object: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        vc = segue.destination as? SubViewController
        vc?.delegate = self
        vc?.cellName = cellContent
//        delegate?.sendData(data: cellContent)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        guard let customCell = cell as? TableViewCell else{
            return cell
        }
        
        customCell.titleLabel.text = array[indexPath.row].title
        customCell.descLabel.text = array[indexPath.row].desc
        return customCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellContentTemp = array[indexPath.row].title
        currentCell = indexPath.row
        
        cellContent = cellContentTemp ?? "fucked"
        vc?.cellName = cellContent
//        performSegue(withIdentifier: "identifier", sender: self) 
    }
    
    @objc func showSpinningWheel(_ notification: NSNotification) {
        
        if let str = notification.userInfo?["str"] as? String {
            self.navigationItem.title = str
        }
    }
}

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

