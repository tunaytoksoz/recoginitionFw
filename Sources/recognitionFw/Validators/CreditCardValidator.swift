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
        
        print(input)
        var cardNumber :String = ""
        var expirationDate : String = ""
        
        for text in input {
            if Int(text.replacingOccurrences(of: " ", with: "")) != nil {
                cardNumber += text + " "
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
