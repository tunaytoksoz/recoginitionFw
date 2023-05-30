//
//  File.swift
//  TextRecognitionVNController
//
//  Created by Tunay Toksöz on 26.04.2023.
//

import Foundation

public class CreditCardValidator {
    
    public init() {}
    
    func validateCardNumber(input : [String]) -> (String,String) {

        var cardNumber :String = ""
        var expirationDate : String = ""
        let pattern = "\\b\\d{4}\\s\\d{4}\\s\\d{4}\\s\\d{4}\\b"
        
    /**
     for text in input {
         if Int(text.replacingOccurrences(of: " ", with: "")) != nil && cardNumber.count < 20 {
             cardNumber += text + " "
         }
     }
     */
        
        let regexCardNumber = try! NSRegularExpression(pattern: pattern)
            
        for string in input {
                if let match = regexCardNumber.firstMatch(in: string, range: NSRange(string.startIndex..., in: string)) {
                    cardNumber = String(string[Range(match.range, in: string)!])
            }
        }
            

        let text = input.joined(separator: "").replacingOccurrences(of: " ", with: "")
        
        let regex = try! NSRegularExpression(pattern: "(0[1-9]|1[0-2])/(2[2-9]|[3-9][0-9])")

        let range = NSRange(text.startIndex..<text.endIndex, in: text)
        let matches = regex.matches(in: text, range: range)

        for match in matches {
            let skt = (text as NSString).substring(with: match.range)
            expirationDate = skt
        }
        
        return (cardNumber,expirationDate)
    }
}
