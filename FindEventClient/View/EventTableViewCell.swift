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
    
    
    
    func update(with event: Event){
        event_name.text = event.name
        event_date.text = event.getDateToString()
    
    }
    
}
