//
//  IbanValidator.swift
//  TextRecognitionVNController
//
//  Created by Tunay Toksöz on 28.04.2023.
//"TR[0-9]{24}"

import Foundation
import UIKit

public class IbanValidator {
    
    public init() {}
    
    func validateIban(input : [String]) -> [String] {
        print(input)
        var ibanArray : [String] = []
  
        let pattern = "\\bTR\\s?\\d{2}\\s?\\d{4}\\s?\\d{4}\\s?\\d{4}\\s?\\d{4}\\s?\\d{2}\\b"

        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        

        for string in input {
            let range = NSRange(location: 0, length: string.utf16.count)
            if let match = regex.firstMatch(in: string, options: [], range: range) {
                let matchedString = (string as NSString).substring(with: match.range)
                ibanArray.append(matchedString)
            }
        }
        
        print(ibanArray.first)
      
        
        return ibanArray
    }
}
