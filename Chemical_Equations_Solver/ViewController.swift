//
//  ViewController.swift
//  Chemical_Equations_Solver
//
//  Created by Cody Anderson on 1/3/20.
//  Copyright © 2020 Cody Anderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rightSideEqLabel: UILabel!
    @IBOutlet weak var leftSideEqLabel: UILabel!
    
    // This button takes whatever molecule the slider has currently selected and adds it to the left side of the equation
    @IBAction func addMoleculeRight(_ sender: Any) {
        
        
    }
    
    
    
    
    // This button takes whatever molecule the slider has currently selected and adds it to the left side of the equation
    @IBAction func addMoleculeLeft(_ sender: Any) {
        
        
    }
    
    
    

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
        myMolecule.addElement(element: "H", multiplicity: 2)
        myMolecule.incrementElement(element: "W", multiplicity: 25)
        let mult = myMolecule.getMultiplicity(element: "H")
        let mult2 = myMolecule.getMultiplicity(element: "@")
        print(mult)
        print(mult2)
        
    
        // This is example code for how to create a string with subscripts
        let font:UIFont? = UIFont(name: "Helvetica", size:20)
        let fontSub:UIFont? = UIFont(name: "Helvetica", size:10)
        let attString:NSMutableAttributedString = NSMutableAttributedString(string: "H2O", attributes: [.font:font!])
        attString.setAttributes([.font:fontSub!,.baselineOffset:-3], range: NSRange(location:1,length:1))
        rightSideEqLabel.attributedText = attString
        
    }


}

