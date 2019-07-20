//
//  Textfield+Validation.swift
//  TextFieldRestriction
//
//  Created by Vijay Yadav on 20/07/19.
//  Copyright © 2019 Vijay Yadav. All rights reserved.
//

import Foundation

class ValidationService {
    static var shared = ValidationService()
    
    func isAlphabetOnly(string: String) -> Bool {
        let characterSet = CharacterSet.letters
        if string.rangeOfCharacter(from: characterSet.inverted) != nil {
            return false
        }
        return true
    }
    
    func isAlphaNumericOnly(string: String) -> Bool {
        let characterSet = CharacterSet.alphanumerics
        if string.rangeOfCharacter(from: characterSet.inverted) != nil {
            return false
        }
        return true
    }
    
    func isAlphabetWhiteSpace(string: String) -> Bool {
        /*
         pattern: ".*[^A-Za-z0-9 ].*" its allow to enter characters, numbers, or space(" ")
         
         pattern: ".*[^A-Za-z ].*" its allow to enter characters, or space(" ")
         
         pattern: ".*[^A-Za-z].*" its allow to enter only characters
         */
        
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
            if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
                return false
            } else {
                return true
            }
        }
        catch {
            return false
        }
    }
}
