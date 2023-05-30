//
//  File.swift
//  
//
//  Created by Tunay Toksöz on 30.05.2023.
//

import Foundation

public protocol CustomControllerDelegate : AnyObject {
    func didCompletedRecognition(result : String, isSucces : Bool)
}
