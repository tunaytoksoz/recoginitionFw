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
        let input = ["Nakit ihtiyaciniza hizli cözüm", "Sekerbank\'ta!", "Sekerbank.S gobonus", "Sekerbank& gobonus", "56 7890", "4111 5613 3456 7890", "411", "HANDE AKIN", "sus 07/22", "VISA", "%1,60°", "SekerbankS"]
        
        let result = sut.validateCardNumber(input: input)
        
        XCTAssertEqual( result.0, "4111 5613 3456 7890")
        XCTAssertEqual( result.1, "07/22")
        
    }
}
