//
//  EmployeeManager.swift
//  EmployeeDatabaseWithResposteryPattern
//
//  Created by Sahid Reza on 15/01/23.
//

import Foundation

struct EmployeeManager{
    
    var _employeeRespostery = EmployeeRepostree()
    
    func saveEmployeeData(with employeeData:EmployeeData){
        
        _employeeRespostery.employeeSavaData(employeeData: employeeData)
        
    }
    
    func readEmployeeData() -> [EmployeeData]?{
        
        let fetchData = _employeeRespostery.fecthEmployeeData()
        
        return fetchData
    }
    
    func gettingId(with employeID:UUID) -> EmployeeData?{
        
        let geetingID = _employeeRespostery.getUdId(employeId: employeID)
        
        return geetingID
    }
    
    func updateEmployeeData(employee: EmployeeData) -> Bool{
        
        let updateEmployeeData = _employeeRespostery.updateEmployeeData(employee: employee)
        
        if updateEmployeeData{
            
            return true
            
        }else{
        
            return false
        }
        
    }
    
    func deleteEmployeeData(employee: EmployeeData) -> Bool{
        
        let updateEmployeeData = _employeeRespostery.deleteEmployeeData(employee: employee)
        
        if updateEmployeeData{
            
            return true
            
        }else{
        
            return false
        }
        
    }
    
}
