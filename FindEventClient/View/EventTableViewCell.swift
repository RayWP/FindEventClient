//
//  EventTableViewCell.swift
//  FindEventClient
//
//  Created by Raymond on 26/06/21.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    
    @IBOutlet weak var event_name: UILabel!
    @IBOutlet weak var event_date: UILabel!
    @IBOutlet weak var event_link: UILabel!
    @IBOutlet weak var event_desc: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with event: Event){
        let df = DateFormatter()
        df.dateFormat = "YY/mm/dd"
        event_name.text = event.name
        event_date.text = df.string(from: event.date)
//        event_link.text = event.link
        print("event link: ", event.link )
//        event_desc.text = event.description
    
    }
    
}
