# recoginitionFw
recognitionFw is detect card and iban numbers using Vision Framework. 


## Installation

You can install using Swift Package Manager 

```swift
        https://github.com/tunaytoksoz/recoginitionFw.git
```

## Usage

IbanController

```swift
        let vc = IbanController()
        vc.delegate = self
        vc.modalPresentationStyle = .formSheet
        present(vc, animated: true)
```
CardController

```swift
        let vc = CardController()
        vc.delegate = self
        vc.modalPresentationStyle = .formSheet
        present(vc, animated: true)
```

You can also customize your Regular expression.

CustomController
```swift
        let regex = "[A-Z]{2}[0-9]{24}"
        
        let vc = CustomController(regex: regex)
        vc.delegate = self
        vc.modalPresentationStyle = .formSheet
        present(vc, animated: true)
```

After the picture is selected, you can print the number on the screen with the delegates.

IbanControllerDelegate

```swift
        func didCompletedRecognition(iban: String, isSucces: Bool) {
        dismiss(animated: true)
        if isSucces{
            textField.text = iban
        } else { // }
        }
```

CardControllerDelegate
```swift
    func didCompletedRecognition(CardNumbers: (String, String), isSucces: Bool) {
        dismiss(animated: true)
        if isSucces {
        textField.text = CardNumbers.0
        textField2.text = CardNumbers.1
        } else { // }
    }
```

CustomControllerDelegate
```swift
        func didCompletedRecognition(result: String, isSucces: Bool) {
        dismiss(animated: true)
        if isSucces{
            textField.text = result
        } else { // }
        }
```





