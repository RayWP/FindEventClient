//
//  DataManager.swift
//  FindEventClient
//
//  Created by Raymond on 27/06/21.
//

import Foundation

class BookmarkManager  {
    var event_list: Event!
    
    static func addToBookmark(_ event: Event){
        var bookmarked_event = readBookmark()
        bookmarked_event.append(event)
        saveBookmark(bookmarked_event)
    }
    
    static func isInBookmark(_ event: Event) -> Bool {
        var bookmarked_event = readBookmark()
        var index = 0
        for b_event in bookmarked_event {
            if b_event == event {
                print("size: ", bookmarked_event.count)
                print("index detected: ", index)
                bookmarked_event.remove(at: index)
                return true
            }
            index = index + 1
        }
        return false
    }
    
    static func removeFromBookmark(_ event: Event) {
        var bookmarked_event = readBookmark()
        var index = 0
        for b_event in bookmarked_event {
            if b_event == event {
                print("size: ", bookmarked_event.count)
                print("index detected: ", index)
                bookmarked_event.remove(at: index)
                break
            }
            index = index + 1
        }
        saveBookmark(bookmarked_event)
    }
    
//    is private so only insider can use it
    static private func saveBookmark(_ list: [Event]) {
        let document_dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archive_url = document_dir.appendingPathComponent("event_list").appendingPathExtension("plist")
        let propertyListEncoder = PropertyListEncoder()
        let encoded_list = try? propertyListEncoder.encode(list)
        
        try? encoded_list?.write(to: archive_url, options: .noFileProtection)
        print("saved list: ", list)
    }
    
    static func readBookmark() -> [Event] {
        let document_dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archive_url = document_dir.appendingPathComponent("event_list").appendingPathExtension("plist")
        let propertyListDecoder = PropertyListDecoder()
        if let retrieved_list = try? Data(contentsOf: archive_url), let decodedEvents = try? propertyListDecoder.decode(Array<Event>.self, from: retrieved_list){
            
            return decodedEvents
        } else {
            return []
        }
        
        
    }
}
