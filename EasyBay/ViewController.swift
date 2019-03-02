import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
 
  
  var cameraVC: UIImagePickerController!
  
  var image: UIImage?
  
  @IBAction func tappedCameraButton(_ sender: Any) {
    
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      cameraVC =  UIImagePickerController()
      cameraVC.delegate = self
      cameraVC.sourceType = .camera
      present(cameraVC, animated: true, completion: nil)
    }
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    cameraVC.dismiss(animated: true, completion: nil);
    
    guard let selectedImage = info[.originalImage] as? UIImage else {
      print("Image not found!")
      return
    }
    image = selectedImage
    if let _ = image {
      
      performSegue(withIdentifier: "searchImage", sender: self)
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destVC = segue.destination as! SearchImageViewController
    destVC.image = self.image
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
}
