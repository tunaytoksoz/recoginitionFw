//
//  CardControllerDelegate.swift
//  fw
//
//  Created by Tunay Toksöz on 12.05.2023.
//

import Foundation

public protocol CardControllerDelegate : AnyObject {
    func didCompletedRecognition(CardNumbers : (String,String), isSucces : Bool)
}
