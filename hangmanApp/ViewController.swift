//
//  ViewController.swift
//  hangmanApp
//
//  Created by Ramesh Abeysekara and Matthew Ovie Enamuotor on 30/09/2023.
//

import UIKit

class ViewController: UIViewController {

    
    //Outlets
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var startGameBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGameBtn.isEnabled = false
        // Do any additional setup after loading the view.
    }

    
        //On edit changed of username input
    @IBAction func onUsernameInput(_ sender: Any) {
       
        //Disable button if there is no text in the field
        if !(usernameField.hasText) {
            startGameBtn.isEnabled = false
        }
        else {
            startGameBtn.isEnabled = true
        }
    }
    
    //on click of start game button
    @IBAction func onScreen2Tapped(_ sender: UIButton) {
        
        //Go to second screen only if username field has text in it
        if usernameField.hasText{
            performSegue(withIdentifier: "gotoScreen2", sender: self)
        }
        
        
    }
    
    //passing value to second screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! Screen2ViewController
            
        //passing username to second screen
        viewController.user = "\(usernameField.text ?? "User")"

        //passing usermessage to second screen
        viewController.userMessage = "Let's hang \(viewController.user ?? "Let's hang someone")"
        
        //clear the username field
        usernameField.text = ""
        
        //disable the button
        startGameBtn.isEnabled = false
        
        
    }
   

    
}

