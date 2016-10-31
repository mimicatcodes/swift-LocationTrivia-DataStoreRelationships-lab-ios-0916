
import UIKit

class AddTriviaViewController: UIViewController {
    
    var newLocation:Location?
   
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var textField: UITextField!

    @IBAction func saveButton(_ sender: AnyObject) {
        guard let text = textField.text else {return}
   
        guard let newLocation = newLocation else {
            return
        }
        let newTrivia = Trivium(content: text, likes: 0)
        
        newLocation.trivia.append(newTrivia)
        dismiss(animated: true, completion: nil)
 
    
    }
   
    @IBAction func cancelButton(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAccessibility()

    }

    
    func setAccessibility() {
        saveButton.accessibilityLabel = "Save Button"
        saveButton.accessibilityIdentifier = "Save Button"
        cancelButton.accessibilityLabel = "Cancel Button"
        cancelButton.accessibilityIdentifier = "Cancel Button"
        
        
    }
   
    
}
