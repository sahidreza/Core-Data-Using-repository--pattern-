//
//  EmployeeRepostree.swift
//  EmployeeDatabaseWithResposteryPattern
//
//  Created by Sahid Reza on 15/01/23.
//

//CRUD Oparation For Employee Data

import Foundation
import CoreData

protocol employeeRespesotreeProtocol{
    
    func employeeSavaData(employeeData:EmployeeData)
    func fecthEmployeeData() ->[EmployeeData]?
    func getUdId(employeId:UUID) -> EmployeeData?
    func updateEmployeeData(employee:EmployeeData) -> Bool
    func deleteEmployeeData(employee:EmployeeData) -> Bool
    
}


struct EmployeeRepostree:employeeRespesotreeProtocol{
   
   
    // MARK: - Create Employee Data
    
    func employeeSavaData(employeeData: EmployeeData) {
        
        let cdEmployeeData = CDEmployee(context: PresstanceStorage.shared.context)
        cdEmployeeData.id = employeeData.employeeID
        cdEmployeeData.name = employeeData.emloyeeName
        cdEmployeeData.emailID = employeeData.employeeEmildID
        cdEmployeeData.address = employeeData.employeeAddress
        
        PresstanceStorage.shared.saveContext()
        
        
    }
    
    // MARK: - Read EmployeeData
    
    func fecthEmployeeData() -> [EmployeeData]? {
        
        let request:NSFetchRequest<CDEmployee> = CDEmployee.fetchRequest()
        
        do{
            
            let fectchData = try PresstanceStorage.shared.context.fetch(request)
            var employeDataList = [EmployeeData]()
            
            fectchData.forEach { (cdEmployee) in
                
                let employeData = EmployeeData(employeeID: cdEmployee.id, emloyeeName: cdEmployee.name, employeeEmildID: cdEmployee.emailID, employeeAddress: cdEmployee.address)
                employeDataList.append(employeData)
            }
            
            return employeDataList
            
        }catch{
            
            return nil
        }
        
    }
    
    // MARK: - EmployeeData Update
    
    func updateEmployeeData(employee: EmployeeData) -> Bool {
        
        if  let cdEmployeeData = checkingID(employeeID: employee.employeeID){
            
            cdEmployeeData.name = employee.emloyeeName
            cdEmployeeData.address = employee.employeeAddress
            cdEmployeeData.emailID = employee.employeeEmildID
            
            PresstanceStorage.shared.saveContext()
            
            return true
        }else{
            
            return false
        }
        
        
    }
    
    // MARK: - Delete EmployeData
    
    func deleteEmployeeData(employee: EmployeeData) -> Bool {
        
        if  let cdEmployeeData = checkingID(employeeID: employee.employeeID){
            
            PresstanceStorage.shared.context.delete(cdEmployeeData)
            PresstanceStorage.shared.saveContext()
            
            print("Its working")
            
            return true
        }else{
            
            return false
        }
    }
    
    
    
    
    
    // MARK: - geting ParticularID
    
    func getUdId(employeId:UUID) -> EmployeeData? {
        
        let cdEmployeData = checkingID(employeeID: employeId)
        
        if let safeData = cdEmployeData {
            
            let employeData = EmployeeData(employeeID: safeData.id, emloyeeName: safeData.name, employeeEmildID: safeData.emailID, employeeAddress: safeData.address)
            
          
            
            return employeData
            
        }else{
            
            return nil
        }
        
    
        
    }
    
    
    
    
    private func checkingID(employeeID:UUID) -> CDEmployee?{
        
        let request:NSFetchRequest<CDEmployee> = CDEmployee.fetchRequest()
        let predicate = NSPredicate(format: "id==%@", employeeID as CVarArg)
        request.predicate = predicate
        
        do {
            
            let responseData = try PresstanceStorage.shared.context.fetch(request).first
            
            return responseData
            
        }catch{
            
            print(error)
            
            return nil
        }
        
        
    }
    
}
