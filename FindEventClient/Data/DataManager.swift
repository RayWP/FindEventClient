//
//  DataManager.swift
//  FindEventClient
//
//  Created by Raymond on 28/06/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataManager {
//TODO: tambahin method post buat save item ke server lokal
    
    static var file_name = "event_list"
    static let ext = "plist"
    
    static func addEvent(_ event: Event){
        var event_list = readEvent()
        event_list.append(event)
        saveEvent(list: event_list)
    }
    
    static func readEvent() -> [Event] {
        let document_dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archive_url = document_dir.appendingPathComponent(file_name).appendingPathExtension(ext)
        let propertyListDecoder = PropertyListDecoder()
        if let retrieved_list = try? Data(contentsOf: archive_url), let decodedEvents = try? propertyListDecoder.decode(Array<Event>.self, from: retrieved_list){
            
            return decodedEvents
        } else {
            return []
        }
    }
    
    static private func saveEvent(list: [Event]) {
        let document_dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archive_url = document_dir.appendingPathComponent(file_name).appendingPathExtension(ext)
        let propertyListEncoder = PropertyListEncoder()
        let encoded_list = try? propertyListEncoder.encode(list)
        
        try? encoded_list?.write(to: archive_url, options: .noFileProtection)
        print("saved list: ", list)
    }
    
    static func getData() {
        AF.request("http://192.168.1.14:8090/categories").responseJSON{ response in
            if let data = response.data{
                let json = JSON(data)
                print("result", json["categories"])
            }
            
        }
    }
    
    static func postData() {
        let parameters: [String: [String]] = [
            "foo": ["bar"],
            "baz": ["a", "b"],
            "qux": ["x", "y", "z"]
        ]
        AF.request("http://192.168.1.14:8090/categories", method: .post, parameters: parameters)
        print("success post data")
    }
    
    static func readData(){
        do {
            let name = "data"
                if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"), let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                    print(JSON(jsonData))
                }
            } catch {
                print(error)
            }
    }
    
}
