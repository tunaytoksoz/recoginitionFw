//
//  File.swift
//  
//
//  Created by Tunay Toksöz on 30.05.2023.
//

import Foundation
import UIKit

public class CustomValidator {
    
    var regex : String
    
    public init(regex: String) {
        self.regex = regex
    }
    
    func validateResult(input : [String]) -> [String] {
        print(input)
        var resultArray : [String] = []
  
        let text = input.joined(separator: "").replacingOccurrences(of: " ", with: "")
                
        let regex = try! NSRegularExpression(pattern: regex)
        
        let range = NSRange(text.startIndex..<text.endIndex, in: text)
        let matches = regex.matches(in: text, range: range)

        for match in matches {
                    let result = (text as NSString).substring(with: match.range)
                    resultArray.append(result)
            
        }
        
        print(resultArray.first)
      
        
        return resultArray
    }
}

