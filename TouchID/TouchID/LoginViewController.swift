//
//  LoginViewController.swift
//  TouchID
//
//  Created by Anish on 10/19/17.
//  Copyright © 2017 Anish Kodeboyina. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginViewController: UIViewController {
    
    // MARK: - View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Memory methods
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    @IBAction func touchIDBtnPressed(_ sender: Any) {
        touchIDVerification()
    }
    
    // MARK: - Helper Methods
    /** Checks the availability of touch ID Authentication and displays the Touch ID Alert VC. */
    func touchIDVerification() -> Void {
    
        let authenticationContext  : LAContext = LAContext()
        var error : NSError?
        
        if authenticationContext.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authenticationContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics,
                                                 localizedReason: "TouchID",
                                                 reply: { (wasSuccess:Bool,
                                                                error:Error?) in
                if wasSuccess {
                    print("Successful");
                } else {
                    print("failed because: \(String(describing: error))");
                }
            })
        } else {
            print("No Touch ID");
        }
    }
}
