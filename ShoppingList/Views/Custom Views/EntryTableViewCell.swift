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
    
    

}
