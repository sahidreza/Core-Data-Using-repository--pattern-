//
//  EmployeeLIstTableViewController.swift
//  EmployeeDatabaseWithResposteryPattern
//
//  Created by Sahid Reza on 15/01/23.
//

import UIKit

class EmployeeLIstTableViewController: UITableViewController {
    
    var employeeManager = EmployeeManager()
    var employeList = [EmployeeData]()
    
    @IBOutlet var employeeTableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let employeDataList = employeeManager.readEmployeeData(){
            
            employeList = employeDataList
            
            DispatchQueue.main.async {
            
                self.employeeTableView.reloadData()
            }
        }
        

    }
    
}

// MARK: - Data Source Delegate

extension EmployeeLIstTableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return employeList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellIdentifier.employeeTableViewCell, for: indexPath)
        
        cell.textLabel?.text = employeList[indexPath.row].emloyeeName
        
        return cell
        
    }
    
    
    
}

// MARK: - TableviewDelegate

extension EmployeeLIstTableViewController{
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        performSegue(withIdentifier: K.SegueIdentifier.employeListToOneEmployee, sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let desinationVc = segue.destination as! EmployeeViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            desinationVc.id = employeList[indexPath.row].employeeID
        }
        
    }
    
}
