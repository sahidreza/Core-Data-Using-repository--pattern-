//
//  EmployeeViewController.swift
//  EmployeeDatabaseWithResposteryPattern
//
//  Created by Sahid Reza on 15/01/23.
//

import UIKit

class EmployeeViewController: UIViewController {
    
    var employeeManger = EmployeeManager()
    
    @IBOutlet weak var enterYourName: UITextField!
    
    @IBOutlet weak var enterYourEmailAdress: UITextField!
    
    @IBOutlet weak var enterYourAdress: UITextField!
    
    var employeeID:UUID?
    
    
    var id = UUID()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let gettingNewRecord = employeeManger.gettingId(with: id){
            DispatchQueue.main.async {
                self.enterYourName.text = gettingNewRecord.emloyeeName
                self.enterYourEmailAdress.text = gettingNewRecord.employeeEmildID
                self.enterYourAdress.text = gettingNewRecord.employeeAddress
                self.employeeID = gettingNewRecord.employeeID
            }
        }
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func updatePressed(_ sender: UIButton) {
        
        let employeData = EmployeeData(employeeID: employeeID!, emloyeeName: enterYourName.text!, employeeEmildID: enterYourEmailAdress.text!, employeeAddress: enterYourAdress.text!)
        let dataUpdate =  employeeManger.updateEmployeeData(employee: employeData)
        
        if dataUpdate {
           
            self.navigationController?.popToRootViewController(animated: true)

            print("Success")
        } else {
            
           print("Faluire")
        }
        
        
    }
    
    
    @IBAction func deletePressed(_ sender: UIButton) {
        
        let employeData = EmployeeData(employeeID: employeeID!, emloyeeName: enterYourName.text!, employeeEmildID: enterYourEmailAdress.text!, employeeAddress: enterYourAdress.text!)
        let dataUpdate =  employeeManger.deleteEmployeeData(employee: employeData)
        
        if dataUpdate {
            
            self.navigationController?.popToRootViewController(animated: true)

            print("Success")
        } else {
            
           print("Faluire")
        }
        
    }
    

}
