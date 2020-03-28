//
//  Molecule.swift
//  Chemical_Equations_Solver
//
//  Created by Cody Anderson on 3/20/20.
//  Copyright © 2020 Cody Anderson. All rights reserved.
//

import Foundation

class Molecule {
    
    private let name: String
    private var moleculeData: Dictionary<String, Int>
    
    init(molName: String){
        
        self.name = molName
        moleculeData = [:]
        
    }
    
    // Note that if the key you are trying to acess doesnt exist, the dictionary returns nil
    func addElement(element:String, multiplicity:Int){
        
        if(moleculeData[element] == nil){
            moleculeData[element] = multiplicity
        } else {
            print("Error! That element is already in the molecule!")
        }
    }
    
    
    // Note that if the key you are trying to acess doesnt exist, the dictionary returns nil
    func incrementElement(element:String, multiplicity:Int){
        let num = moleculeData[element]
        
        if (num != nil){
            moleculeData[element] = num! + multiplicity
        } else {
            print("Error! the key you entered does not exist.")
        }
    }
    
    
    // Note that if the key you are trying to acess doesnt exist, the dictionary returns nil
    func contains(element:String) -> Bool {
        let testVar = moleculeData[element]
        
        if (testVar != nil) {
            return true
        } else {
            return false
        }
    }
    
    // Note that if the key you are trying to acess doesnt exist, the dictionary returns nil
    func getMultiplicity(element:String) -> Int {
        
        let num = moleculeData[element]
        
        if (num != nil){
            return num!
        } else {
            return 0
        }
    }
    
    // function returns the name of the molecule
    func getName() -> String {
        return name
        
    }
    
    func getNumUniqueAtoms() -> Int {
        
        return Array(moleculeData.keys).count
        
        
    }
    
}





