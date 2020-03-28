//
//  ViewController.swift
//  Chemical_Equations_Solver
//
//  Created by Cody Anderson on 1/3/20.
//  Copyright © 2020 Cody Anderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var equationLabel: UILabel!
    
    // This button takes whatever molecule the slider has currently selected and adds it to the left side of the equation
    @IBAction func addMoleculeRight(_ sender: Any) {
        
        let moleculeName = textField.text
        
        if (moleculeName != ""){
            
            let mol: Molecule
            
            mol = convertStringToMolecule(moleculeString: moleculeName!)
            
            rightMolecules.append(mol)
            
        }
        
        textField.text = ""
    }
    
    
    
    
    // This button takes whatever molecule the slider has currently selected and adds it to the left side of the equation
    @IBAction func addMoleculeLeft(_ sender: Any) {
        
        let moleculeName = textField.text
        
        if (moleculeName != ""){
            
            let mol: Molecule
            
            mol = convertStringToMolecule(moleculeString: moleculeName!)
            
            leftMolecules.append(mol)
            
        }
        
        textField.text = ""
    }
    
    // This button ballances the currently displayed equation.
    @IBAction func balanceEquation(_ sender: Any) {
        
    }
    
    
    // Define Molecule arrays to keep track of the molecules on each side of the equation
    var leftMolecules: [Molecule] = []
    var rightMolecules: [Molecule] = []
    
    
    // Function description: convertStringToMolecule takes in a string and processes its information. This information is stored and returned as a molecule Object.
    func convertStringToMolecule(moleculeString:String) -> Molecule {
        
        let mol = Molecule(molName: moleculeString)
        
        
        // instantiate variables for string traversal
        var i = 0
        let length = moleculeString.count
        
        var moleculeData: Dictionary<String, Int>
        moleculeData = [:]
        let charArray = Array(moleculeString)
        
        while (i < (length - 1)){
            
            let element = String(charArray[i])
            
            // If the next element is a number, Do this.
            if let multiplicity = Int(String(charArray[i+1])) {
                
                moleculeData[element] = multiplicity
                
                // increment by 2 to skip the multiplicity
                i = i + 2
                
            // The element does not have a multiplicity after it
            } else {
                
                let testForExistence = moleculeData[element]
                
                // if the atom already exists, increment it by 1
                if (testForExistence != nil){
                    
                    moleculeData[element] = moleculeData[element]! + 1
                 
                // if the atom doesnt exist, add it to the molecule
                } else {
                    moleculeData[element] = 1
                }
                
                // increment by 1 as normal
                i = i + 1
            }
            
        }
        
        // Take care of last pass through loop where you know that you cannot be on a number
        if (i < length){
            let element = String(charArray[i])
        
            let testForExistence = moleculeData[element]
        
            // if the atom already exists, increment it by 1
            if (testForExistence != nil){
                
                moleculeData[element] = moleculeData[element]! + 1
                
            // if the atom doesnt exist, add it to the molecule
            } else {
                moleculeData[element] = 1
            }
        }
        
        
        
        // add all of the atoms and their multiplicities to mol
        for key in moleculeData.keys {
            mol.addElement(element: key, multiplicity: moleculeData[key]!)
        }
        
        
        // return the generated molecule
        return mol
    }
    
    
    // helper function that updates the equation labels
    func updateGraphics(){
        
        var eqString = ""
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    
        
        // Test Code for the molecule class.
        let myMolecule = Molecule(molName: "H2O")
        myMolecule.addElement(element: "H", multiplicity: 1)
        myMolecule.incrementElement(element: "H", multiplicity: 1)
        myMolecule.addElement(element: "O", multiplicity: 1)
        let OisIN = myMolecule.contains(element: "O")
        let HisIn = myMolecule.contains(element: "H")
        print(OisIN)
        print(HisIn)
        myMolecule.addElement(element: "H", multiplicity: 2)
        myMolecule.incrementElement(element: "W", multiplicity: 25)
        let mult = myMolecule.getMultiplicity(element: "H")
        let mult2 = myMolecule.getMultiplicity(element: "@")
        print(mult)
        print(mult2)
        
        print("Hallo Werld")
        
        
    
        // This is example code for how to create a string with subscripts
        let font:UIFont? = UIFont(name: "Helvetica", size:20)
        let fontSub:UIFont? = UIFont(name: "Helvetica", size:10)
        let attString:NSMutableAttributedString = NSMutableAttributedString(string: "H2O", attributes: [.font:font!])
        attString.setAttributes([.font:fontSub!,.baselineOffset:-3], range: NSRange(location:1,length:1))
        equationLabel.attributedText = attString
        
    }


}

