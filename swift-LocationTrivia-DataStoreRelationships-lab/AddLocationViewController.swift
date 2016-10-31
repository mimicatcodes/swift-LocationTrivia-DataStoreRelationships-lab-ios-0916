
import UIKit

class AddLocationViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var latitudeField: UITextField!
    @IBOutlet weak var longitudeField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    @IBAction func cancelButton(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: AnyObject) {
        guard let name = nameField.text else {return}
        
        guard let latitude = latitudeField.text, latitude != "" else{return}
        guard let longitude = longitudeField.text, longitude != "" else{return}
        
        // latitudeField and longitudeField have number pads set.
        
        let newLocation = Location(name: name, latitude: Float(latitude)!, longitude: Float(longitude)!)
        
        LocationDataStore.sharedInstance.locations.append(newLocation)
        dismiss(animated: true, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAccessibilityLabelAndIdentifier()

    }
    
    func setAccessibilityLabelAndIdentifier(){
        nameField.accessibilityLabel = "nameField"
        nameField.accessibilityIdentifier = "nameField"
        latitudeField.accessibilityLabel = "latitudeField"
        latitudeField.accessibilityIdentifier = "latitudeField"
        longitudeField.accessibilityLabel = "longitudeField"
        longitudeField.accessibilityIdentifier = "longitudeField"
        cancelButton.accessibilityLabel = "cancelButton"
        cancelButton.accessibilityIdentifier = "cancelButton"
        saveButton.accessibilityLabel = "saveButton"
        saveButton.accessibilityIdentifier = "saveButton"
    }
    

}
