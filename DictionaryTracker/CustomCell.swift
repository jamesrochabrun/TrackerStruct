//
//  CustomCell.swift
//  DictionaryTracker
//
//  Created by James Rochabrun on 4/4/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

protocol CustomCellDelegate: class {
    func switchCell(customCell: CustomCell)
}

class CustomCell: UITableViewCell {

    
    weak var delegate: CustomCellDelegate?
    @IBOutlet weak var customSwicth: UISwitch!
    @IBOutlet weak var customLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        customSwicth.addTarget(self, action: #selector(switchValue), for: .valueChanged)
    }
    
    func setUpCell(with model: ViewModel) {
        customLabel.text = model.name
        customSwicth.setOn(model.invited, animated: false)
    }
    
    func switchValue() {
        delegate?.switchCell(customCell: self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}





