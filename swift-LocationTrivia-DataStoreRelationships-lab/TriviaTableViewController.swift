
import UIKit

class TriviaTableViewController: UITableViewController {
   
    var location : Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.accessibilityLabel = "Trivia Table"
        tableView.accessibilityIdentifier = "Trivia Table"
        
        print("location = \(location)")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
        // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let location = location {
            return location.trivia.count
        }
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)
        if let location = location {
            cell.textLabel?.text = location.trivia[indexPath.row].content
            cell.detailTextLabel?.text = String(describing: location.trivia[indexPath.row].likes)
            

        }
                return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTrivia" {
            if let dest = segue.destination as? AddTriviaViewController {
            dest.newLocation = location
            }
        }
    }
    
    
 
}
