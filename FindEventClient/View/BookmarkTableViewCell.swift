//
//  BookmarkTableViewCell.swift
//  FindEventClient
//
//  Created by Raymond on 27/06/21.
//
import UIKit

class BookmarkTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var bookmark_name: UILabel!
    
    @IBOutlet weak var bookmark_date: UILabel!
    
    func update(with event: Event){
        bookmark_name.text = event.name
        bookmark_date.text = event.getDateToString()
    
    }
    
}
