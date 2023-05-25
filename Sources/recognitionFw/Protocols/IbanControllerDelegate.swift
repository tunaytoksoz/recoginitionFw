//
//  IbanControllerDelegate.swift
//  fw
//
//  Created by Tunay Toksöz on 12.05.2023.
//

import Foundation

public protocol IbanControllerDelegate : AnyObject {
    func didCompletedRecognition(iban : String, isSucces : Bool)
}
