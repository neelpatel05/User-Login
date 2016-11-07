//
//  ViewController.swift
//  User Login Firebase
//
//  Created by Neel Patel on 07/11/16.
//  Copyright © 2016 Neel Patel. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func post()
    {
        
        FIRAuth.auth()?.signIn(withEmail: email.text!, password: password.text!, completion: {
            
            
            user, error in
            if error != nil
            {
                self.label.text! = "Error"
                self.label.textColor! = UIColor.black
                self.email.text = ""
                self.password.text = ""
            }
            else
            {
                self.label.text! = "Logged in!!!!"
                self.label.textColor! = UIColor.black
                self.email.text = ""
                self.password.text = ""
            }
        })
    }


    @IBAction func button(_ sender: Any) {
        
        FIRAuth.auth()?.createUser(withEmail: email.text!, password: password.text!, completion: {
            
            user, error in
            
            if error != nil
            {
                self.post()
            }
            else
            {
                self.label.text! = "New User Created !!!"
                self.label.textColor! = UIColor.black
                self.post()
            }
        })
        

        
    }
    
    @IBAction func signout(_ sender: Any) {
        
        try! FIRAuth.auth()?.signOut()
        self.label.text! = "Now you are signed out"
        self.label.textColor! = UIColor.black
        
    }

}

