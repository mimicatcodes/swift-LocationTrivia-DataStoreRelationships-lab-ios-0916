
import UIKit

class LocationTableViewController: UITableViewController {
    
    var store = LocationDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.accessibilityLabel =  "Locations Table"
        tableView.accessibilityIdentifier = " Locations Table"
        navigationItem.rightBarButtonItem?.accessibilityIdentifier = "Add Trivia Button"
        navigationItem.rightBarButtonItem?.accessibilityLabel = "Add Trivia Button"

    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.locations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        cell.textLabel?.text = store.locations[indexPath.row].name
        cell.detailTextLabel?.text = String(store.locations[indexPath.row].trivia.count)
        return cell
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTrivia" {
           if let dest = segue.destination as? TriviaTableViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            dest.location = store.locations[indexPath.row]
            
            }
        }
        
        
        
    }
    


   
}
