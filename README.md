# recoginitionFw
recognitionFw is detect card and iban numbers using Vision Framework. 

## Usage

```swift
        let vc = IbanController()
        vc.delegate = self
        vc.modalPresentationStyle = .formSheet
        present(vc, animated: true)
```


```swift
        let vc = IbanController()
        vc.delegate = self
        vc.modalPresentationStyle = .formSheet
        present(vc, animated: true)
```

After the picture is selected, you can print the number on the screen with the protocol.

```swift
        func didCompletedRecognition(iban: String, isSucces: Bool) {
        dismiss(animated: true)
        textField.text = iban
    }
```
## Installation

You can install using Swift Package Manager 

* [https://github.com/tunaytoksoz/recoginitionFw.git](https://github.com/tunaytoksoz/recoginitionFw.git)

