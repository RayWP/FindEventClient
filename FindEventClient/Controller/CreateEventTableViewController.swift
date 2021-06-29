//
//  CreateEventTableViewController.swift
//  FindEventClient
//
//  Created by Raymond on 28/06/21.
//

import UIKit

class CreateEventTableViewController: UITableViewController {

    @IBOutlet weak var event_name: UITextField!
    @IBOutlet weak var event_link: UITextField!
    @IBOutlet weak var event_date: UIDatePicker!
    @IBOutlet weak var event_desc: UITextField!
    
    @IBOutlet weak var clearBtn: UIBarButtonItem!
    @IBOutlet weak var save_btn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateSaveBtnState()
    }
    
    @IBAction func onSaveBtnClick(_ sender: Any) {
        let name = event_name.text!
        let link = event_link.text!
        let desc = event_desc.text!
        let date = event_date.date
        
        let new_event = Event(name: name, date: date, link: link, description: desc)
        
        DataManager.addEvent(new_event)
        print("success add event: ", new_event)
        onClearBtnClick(sender)
    }
    
    
//    check apa kah Save button boleh aktif atau tidak
    func updateSaveBtnState(){
//        check if all text input already fill
        if let bool = event_name.text?.isEmpty {
            if bool {
                save_btn.isEnabled = !bool
                return
            }
        }
        if let bool = event_link.text?.isEmpty {
            if bool {
                save_btn.isEnabled = !bool
                return
            }
        }
        if let bool = event_desc.text?.isEmpty {
            if bool {
                save_btn.isEnabled = !bool
                return
            }
        }
        
        save_btn.isEnabled = true
        
    }
    
    @IBAction func onTextNameChanged(_ sender: Any) {
        updateSaveBtnState()
    }
    
    @IBAction func onLinkTextChanged(_ sender: Any) {
        updateSaveBtnState()
    }
    
    @IBAction func onDescTextChanged(_ sender: Any) {
        updateSaveBtnState()
        
    }
    
    @IBAction func onClearBtnClick(_ sender: Any) {
        event_name.text = ""
        event_link.text = ""
        event_desc.text = ""
        updateSaveBtnState()
    }
    
    
    
    // MARK: - Table view data source



    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
