//
//  ListTableViewController.swift
//  FindEventClient
//
//  Created by Raymond on 25/06/21.
//

import UIKit
import Alamofire
import SwiftyJSON

//https://betterprogramming.pub/how-to-add-a-pull-to-refresh-feature-in-your-uitableviewcontroller-using-swift-5622fbf35664

class ListTableViewController: UITableViewController, UISearchBarDelegate {

    var event_list = [Event]()
    var full_event = [Event]()
    var curr_event = Event(name: "", date: Date(), link: "", description: "")
    
    @IBOutlet weak var search_bar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        search_bar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        full_event = DataManager.readEvent()
        event_list = full_event
        getDataFromApi()
    }
    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        let query = searchBar.text ?? ""
//        var event_query = [Event]()
//        if query != "" {
//            for event in event_list {
//                if event.name.contains(query) {
//                    event_query.append(event)
//                }
//            }
//            event_list = event_query
//        } else {
//            event_list = DataManager.readEvent()
//        }
//        tableView.reloadData()
//    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        var event_query = [Event]()
        if searchText != "" {
            for event in full_event {
                if event.name.lowercased().contains(searchText.lowercased()) {
                    event_query.append(event)
                }
            }
            event_list = event_query
        } else {
            viewWillAppear(true)
        }
        print("query:'",searchText,"'")
        tableView.reloadData()
    }
    
    func getDataFromApi() {
        
        AF.request("https://my-json-server.typicode.com/RayWP/EventAPI/db").responseJSON{ response -> Void in
            if let data = response.data{
                let json = JSON(data)
                let events = json["events"]
                for event in events {
                    let name = event.1["name"].string
                    let link = event.1["link"].string
                    let date = event.1["date"].string
                    let desc = event.1["desc"].string
                    let get_event = Event(name: name!, date: Event.getStringToDate(new_date: date!), link: link!, description: desc!)
                    self.event_list.append(get_event)
                    self.full_event.append(get_event)
                    self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return event_list.count
        return event_list.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "event_cell", for: indexPath) as! EventTableViewCell
        
        cell.update(with: event_list[indexPath.row])
        
        // Configure the cell...

        return cell
    }

    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detail_segue" else {
            return
        }
        
        guard let index_path = tableView.indexPathForSelectedRow else {
            return
        }
        
        curr_event = event_list[index_path.row]
        print("selected item: " + curr_event.name)
        
        let destination = segue.destination as! EventDetailViewController
        destination.event = curr_event
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
