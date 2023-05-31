import XCTest
@testable import recognitionFw

final class recognitionFwTests: XCTestCase {
    
    let sut = CreditCardValidator()
    
    func testExample() throws {
        // XCTest Documenation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
    
    func testValidateCardNumber(){
        let input = ["b","a"]
        
        let result = sut.validateCardNumber(input: input)
        
        
    }
}
