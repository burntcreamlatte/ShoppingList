//
//  EntryTableViewCell.swift
//  ShoppingList
//
//  Created by Aaron Shackelford on 11/15/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

import UIKit

protocol EntryTableViewCellDelegate: class {
    func checkButtonTapped(_ sender: EntryTableViewCell)
}
class EntryTableViewCell: UITableViewCell {

    weak var delegate: EntryTableViewCellDelegate?
    
    @IBOutlet weak var entryBodyLabel: UILabel!
    @IBOutlet weak var checkedButton: UIButton!
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.checkButtonTapped(self)
    }
}
extension EntryTableViewCell {
    func update(withEntry entry: Entry) {
        entryBodyLabel.text = entry.entryBody
        if !entry.isChecked {
            checkedButton.setImage(UIImage(named: "incomplete"), for: .normal)
        } else {
            checkedButton.setImage(UIImage(named: "complete"), for: .normal)
        }
    }
}
