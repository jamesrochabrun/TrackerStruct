//
//  ViewController.swift
//  DictionaryTracker
//
//  Created by James Rochabrun on 4/4/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

//1 creating a model to hold the state of each cell
struct ViewModel {
    var invited: Bool
    var name: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableview: UITableView!
    
    var itemsIntable: Int = 30
    
    //2 this array must be the same amount of items in the tableview
    //this is dummy data
    var viewModelArray: [ViewModel] = [ViewModel]()
    func fillDataArray() {
        for i in 0..<itemsIntable {
            let vm = ViewModel(invited: false, name: "James -- \(i)")
            viewModelArray.append(vm)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fillDataArray()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsIntable
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.delegate = self
        cell.setUpCell(with: viewModelArray[indexPath.row])
        return cell
    }
}

extension ViewController: CustomCellDelegate {
    
    //the delegate methos will save the state in each model array object
    func switchCell(customCell: CustomCell) {
        let indexPath = tableview.indexPath(for: customCell)!
        viewModelArray[indexPath.row].invited = customCell.customSwicth.isOn
    }
}

















