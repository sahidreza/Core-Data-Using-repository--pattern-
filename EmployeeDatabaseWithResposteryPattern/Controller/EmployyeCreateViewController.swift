//
//  ViewController.swift
//  EmployeeDatabaseWithResposteryPattern
//
//  Created by Sahid Reza on 15/01/23.
//

import UIKit

class EmployyeCreateViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var emilAdressTextField: UITextField!
    
    @IBOutlet weak var adressTextField: UITextField!
    
    var employeeManager = EmployeeManager()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileManager = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(fileManager,"FileManager")
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let employeeData = EmployeeData(employeeID: UUID() , emloyeeName: userNameTextField.text!, employeeEmildID: emilAdressTextField.text!, employeeAddress: adressTextField.text!)
        
        employeeManager.saveEmployeeData(with: employeeData)
        performSegue(withIdentifier: K.SegueIdentifier.employeeRegisterToEmployeList, sender: self)
        
        userNameTextField.text = ""
        emilAdressTextField.text = ""
        adressTextField.text = ""

    
    }
    
    
    
    
}

