//
//  EventDetailViewController.swift
//  FindEventClient
//
//  Created by Raymond on 26/06/21.
//

import UIKit

class EventDetailViewController: UIViewController {

    var my_event = Event(name: "", date: Date(), link: "", description: "")
    var isbookmarked = true
    @IBOutlet weak var event_name: UILabel!
    @IBOutlet weak var event_date: UILabel!
    @IBOutlet weak var event_link: UILabel!
    @IBOutlet weak var event_desc: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "bookmark.fill")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func bookmarkThis(_ sender: Any) {
        
        if isbookmarked {
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "bookmark")
            isbookmarked = false
        } else {
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "bookmark.fill")
            isbookmarked = true
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
