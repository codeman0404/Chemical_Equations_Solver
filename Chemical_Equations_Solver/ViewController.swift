//
//  ViewController.swift
//  Chemical_Equations_Solver
//
//  Created by Cody Anderson on 1/3/20.
//  Copyright © 2020 Cody Anderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        
        var myMolecule = Molecule(molName: "H2O")
        myMolecule.addElement(element: "H", multiplicity: 1)
        myMolecule.incrementElement(element: "H", multiplicity: 1)
        myMolecule.addElement(element: "O", multiplicity: 1)
        let OisIN = myMolecule.contains(element: "O")
        let HisIn = myMolecule.contains(element: "H")
        print(OisIN)
        print(HisIn)
        print(myMolecule.moleculeData)
        myMolecule.addElement(element: "H", multiplicity: 2)
        myMolecule.incrementElement(element: "W", multiplicity: 25)
        let mult = myMolecule.getMultiplicity(element: "H")
        let mult2 = myMolecule.getMultiplicity(element: "@")
        print(mult)
        print(mult2)
    }


}

