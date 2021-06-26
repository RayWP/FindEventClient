//
//  Event.swift
//  FindEventClient
//
//  Created by Raymond on 26/06/21.
//

import Foundation

struct Event {
    var name: String
    var date: Date
    var link: String
    var description: String
    
    static func loadSample() -> [Event] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YY/mm/dd"
        let event1 = Event(name: "WWDC 2021", date: formatter.date(from: "2021/02/23")!, link: "apple.com", description: "Biggest 2021 Apple Developer Conference in the world")
        
        let event2 = Event(name: "Azure Fundamentals", date: formatter.date(from: "2021/06/03")!, link: "aka.ms/AzureFund_Apr-Jun", description: "Azure workshop provided by Microsoft")
        
        let event3 = Event(name: "Alibaba CLoud Launching", date: formatter.date(from: "2021/07/05")!, link: "alibabacloud.com", description: "Alibaba Cloud launching its 3rd Data Center in Indonesia")
        
        return [event1, event2, event3]
    }
}
