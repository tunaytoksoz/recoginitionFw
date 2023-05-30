//
//  CardController.swift
//
//  Created by Tunay Toksöz on 25.04.2023.
//


import UIKit
import Vision


public enum sourceType {
    case camera
    case photoLibrary
}

public class CardController: UIViewController{
    
   public let cardValidator =  CreditCardValidator()
    
   public weak var delegate : CardControllerDelegate?
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let sourceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.text = "Select Image Source"
        return label
    }()

    
    private let cameraButton: UIButton = {
        let button = UIButton()
        button.setTitle("Camera", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 10
        
        return button
    }()

    private let libraryButton: UIButton = {
        let button = UIButton()
        button.setTitle("Library", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 10
       
        return button
    }()
    
    let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .opaqueSeparator
        stackView.layer.cornerRadius = 10
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()

    var request: VNRecognizeTextRequest!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        cameraButton.addTarget(self, action: #selector(didTapCameraButton), for: .touchUpInside)
        libraryButton.addTarget(self, action: #selector(didTapLibraryButton), for: .touchUpInside)
        
        textRecognition()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @objc func didTapCameraButton(){
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        
        present(picker, animated: true)
    }
    
    @objc func didTapLibraryButton(){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        
        present(picker, animated: true)
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .clear
        stackView.addArrangedSubview(sourceLabel)
        stackView.addArrangedSubview(cameraButton)
        stackView.addArrangedSubview(libraryButton)
        view.addSubview(stackView)
        
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        libraryButton.translatesAutoresizingMaskIntoConstraints = false
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            cameraButton.widthAnchor.constraint(equalToConstant: 120),
            libraryButton.widthAnchor.constraint(equalToConstant: 120),
  
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }


}


extension CardController {
    
    func textRecognition(){
        // Vision text tanıma request oluşturma
        request = VNRecognizeTextRequest(completionHandler: { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            
            let recognizedStrings = observations.compactMap { observation in
                return observation.topCandidates(1).first?.string
            }
            print(recognizedStrings)
            
            let result = self.cardValidator.validateCardNumber(input: recognizedStrings)
            
            if result.0 == "" {
                self.delegate?.didCompletedRecognition(CardNumbers: result, isSucces: false)
            } else {
                self.delegate?.didCompletedRecognition(CardNumbers: result, isSucces: true)
            }
            
            self.dismiss(animated: true)
        })
        
        request.recognitionLevel = .accurate
        request.recognitionLanguages = ["en-US", "fr-FR", "it-IT", "de-DE", "es-ES", "pt-BR", "zh-Hans", "zh-Hant", "yue-Hans", "yue-Hant", "ko-KR", "ja-JP", "ru-RU", "uk-UA"]
    }
    
    func handlerImage(image : UIImage){
        
        if let image = CIImage(image: image) {
            let handler = VNImageRequestHandler(ciImage: image)
            do {
                try handler.perform([request])
            } catch {
                print(error)
            }
        }
    }
}

extension CardController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {return}
        
        handlerImage(image: image)
        picker.dismiss(animated: true)
    }
}
