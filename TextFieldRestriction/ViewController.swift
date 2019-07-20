//
//  ViewController.swift
//  TextFieldRestriction
//
//  Created by Vijay Yadav on 29/03/19.
//  Copyright © 2019 Vijay Yadav. All rights reserved.
//

import UIKit

//MARK:- Validation Type Enum
//MARK:-
enum ValidationType {
    case Alphabet_Only
    case Alphanumeric_Only
    case Alphabet_Whitespace
}

//MARK:- ViewController Methods
//MARK:-
class ViewController: UIViewController {

    @IBOutlet weak var btnFirst: UIButton!
    @IBOutlet weak var btnSecond: UIButton!
    @IBOutlet weak var btnThird: UIButton!
    @IBOutlet weak var txtField: UITextField!
    
    var validationType = ValidationType.Alphabet_Only
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnFirst.backgroundColor = UIColor.black
    }
}

//MARK:- UIButtton Actions
//MARK:-
extension ViewController {
    @IBAction func clickOnAlphabetOnly(_ sender: UIButton) {
        txtField.text = ""
        validationType = ValidationType.Alphabet_Only
        btnFirst.backgroundColor = UIColor.black
        btnSecond.backgroundColor = UIColor.clear
        btnThird.backgroundColor = UIColor.clear
    }
    
    @IBAction func clickOnAlphanumericOnly(_ sender: UIButton) {
        txtField.text = ""
        validationType = ValidationType.Alphanumeric_Only
        btnFirst.backgroundColor = UIColor.clear
        btnSecond.backgroundColor = UIColor.black
        btnThird.backgroundColor = UIColor.clear
    }
    
    @IBAction func clickOnAlphabetWhiteSpace(_ sender: UIButton) {
        txtField.text = ""
        validationType = ValidationType.Alphabet_Whitespace
        btnFirst.backgroundColor = UIColor.clear
        btnSecond.backgroundColor = UIColor.clear
        btnThird.backgroundColor = UIColor.black
    }
}

//MARK:- UITextField Delegate
//MARK:-
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch validationType {
        case .Alphabet_Only:
            return ValidationService.shared.isAlphabetOnly(string: string)
        case .Alphanumeric_Only:
            return ValidationService.shared.isAlphaNumericOnly(string: string)
        case .Alphabet_Whitespace:
            return ValidationService.shared.isAlphabetWhiteSpace(string: string)
        }
    }
}


