//
//  ViewController.swift
//  testForSegmentedCtrl
//
//  Created by WANKI KIM on 2020/01/21.
//  Copyright © 2020 김완기. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var data = [
        ["⚽️ Soccer",       "⛳️ Golf",      "🏀 Basketball",    "🏈 American Football",
         "⚾️ Baseball",     "🎾 Tennis",    "🏐 Valleyball",    "🏸 Badminton"],
        ["🍎 Apple",        "🍐 Pear",      "🍓 Strawberry",    "🥑 Avocado",
         "🍌 Banana",       "🍇 Grape",     "🍈 Melon",         "🍊 Orange",
         "🍑 Peach",        "🥝 Kiwi"]
    ]
    var month = [
        ["data1", "data2","data3","data1", "data2","data3","data1", "data2"],
        ["data1", "data2","data3","data1", "data2","data3","data1", "data2","data3","data1"]
    ]
    
    var p:Int!

    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        let nibName = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "customCell")

        // Do any additional setup after loading the view.
//        let nib =  UINib(nibName: "CustomCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "customCell")
//        tableView.backgroundColor = UIColor.darkGray
        p=0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[p].count
        //return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomCell
//        //let str = data[p][indexPath.row].components(separatedBy: " ")
//        cell.custominit(text: data[p][indexPath.row], accessoryText: data[p][indexPath.row])
//        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        cell.titleLabel.text = data[p][indexPath.row]
        cell.titleLabel.textColor = UIColor.white
        cell.contentView.backgroundColor = UIColor.darkGray
        cell.accessoryLabel.image = UIImage(named: month[p][indexPath.row])
        cell.titleLabel.sizeToFit()
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
        
    }
    @IBAction func segmentedCtrlViewAction(_ sender: UISegmentedControl) {
        p = sender.selectedSegmentIndex
        tableView.reloadData()

    }
}

