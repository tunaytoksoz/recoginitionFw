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
  
        let text = input.joined(separator: "").replacingOccurrences(of: " ", with: "")
                
        let regex = try! NSRegularExpression(pattern: "[A-Z]{2}[0-9]{24}")
        
        let range = NSRange(text.startIndex..<text.endIndex, in: text)
        let matches = regex.matches(in: text, range: range)

        for match in matches {
                    let iban = (text as NSString).substring(with: match.range)
                    ibanArray.append(iban)
        }
        
        print(ibanArray.first)
      
        
        return ibanArray
    }
}
