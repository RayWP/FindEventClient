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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with event: Event){
        bookmark_name.text = event.name
        bookmark_date.text = event.getDateToString()
//        event_link.text = event.link
//        print("event link: ", event.link )
//        event_desc.text = event.description
    
    }
    
}
