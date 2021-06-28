//
//  EventDetailViewController.swift
//  FindEventClient
//
//  Created by Raymond on 26/06/21.
//

import UIKit
import SafariServices

class EventDetailViewController: UIViewController {

    var event: Event!
    var isbookmarked = false
    @IBOutlet weak var event_name: UILabel!
    @IBOutlet weak var event_date: UILabel!
    @IBOutlet weak var event_link: UILabel!
    @IBOutlet weak var event_desc: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "bookmark")
        
        let df = DateFormatter()
        df.dateFormat = "YY/mm/dd"
        event_name.text = event.name
        event_date.text = df.string(from: event.date)
        event_link.text = event.link
        event_desc.text = event.description
        // Do any additional setup after loading the view.
    }
    
    @IBAction func bookmarkThis(_ sender: Any) {
        
        if isbookmarked {
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "bookmark")
            isbookmarked = false
            DataManager.removeFromBookmark(event)
            
        } else {
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "bookmark.fill")
            isbookmarked = true
            DataManager.addToBookmark(event)
        }
    }
    
    @IBAction func openLink(_ sender: Any) {
        guard let link = event?.link else {
            return
        }
        
        let url_https = "https://" + link
        if let url = URL(string: url_https) {
            let safari =  SFSafariViewController(url: url)
            present(safari, animated: true, completion: nil)
        }
    }
    
    @IBAction func shareEvent(_ sender: Any) {
        
        let shareactivity = UIActivityViewController(activityItems: [event.name, event.link], applicationActivities: nil)
        
        shareactivity.popoverPresentationController?.sourceView = sender as? UIView
        
        present(shareactivity, animated: true, completion: nil)
        
        
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
