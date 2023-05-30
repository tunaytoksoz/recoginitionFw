# recoginitionFw
recognitionFw is detect card and iban numbers using Vision Framework. 

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

After the picture is selected, you can print the number on the screen with the delegates.

IbanControllerDelegate

```swift
        func didCompletedRecognition(iban: String, isSucces: Bool) {
        dismiss(animated: true)
        textField.text = iban
        }
```
CardControllerDelegate
```swift
    func didCompletedRecognition(CardNumbers: (String, String), isSucces: Bool) {
        dismiss(animated: true)
        textField.text = CardNumbers.0
        textField2.text = CardNumbers.1
    }
```


## Installation

You can install using Swift Package Manager 

* [https://github.com/tunaytoksoz/recoginitionFw.git](https://github.com/tunaytoksoz/recoginitionFw.git)

