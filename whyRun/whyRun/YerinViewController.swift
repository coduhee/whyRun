//
//  YerinViewController.swift
//  whyRun
//
//  Created by 변예린 on 12/30/25.
//

import UIKit

class YerinViewController: UIViewController {
    let profileImage = UIImageView(image: .yerinProfile)
    let petImage = UIImageView(image: .yerinPet)
    
    let mbtiLabel = MyLabel("INTP", size: 17, weight: .medium)
    let nameLabel = MyLabel("변예린", size: 25, weight: .bold)
    let levelLabel = MyLabel("Lv.28", size: 17, weight: .bold)
    let jobLabel = MyLabel("백수", size: 17, weight: .medium)

    lazy var descriptionLabel: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(levelLabel)
        stackView.addArrangedSubview(jobLabel)
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var labelSet: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(mbtiLabel)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.alignment = .center
        return stackView
    }()

    let petButton = IconButton(icon: .yerinPetIcon)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    //MARK: UI 셋업
    func setUI() {
        view.backgroundColor = UIColor(red: 0.19, green: 0.22, blue: 0.32, alpha: 1.00) // HEX #303952
        
        view.addSubview(profileImage)
        view.addSubview(labelSet)
        view.addSubview(petButton)
        
        profileImage.contentMode = .scaleAspectFit
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        labelSet.translatesAutoresizingMaskIntoConstraints = false
        petButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: (profileImage.image?.size.width ?? 0) * 1.1),
            profileImage.heightAnchor.constraint(equalToConstant: (profileImage.image?.size.height ?? 0) * 1.1),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -(view.frame.width * 0.1)),
            profileImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            labelSet.bottomAnchor.constraint(equalTo: profileImage.topAnchor, constant: -20),
            labelSet.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor, constant: -(profileImage.frame.width / 2 * 0.15)),
            
            petButton.widthAnchor.constraint(equalToConstant: 65),
            petButton.heightAnchor.constraint(equalToConstant: 65),
            petButton.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 20),
            petButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -(view.frame.width * 0.2))
            ])
        
        petButton.addTarget(self, action: #selector(pushPetButton), for: .touchUpInside)
    }
    
    @objc func pushPetButton() {
        print("petButton pushed")
    }
    
}

//MARK: 커스텀 객체
class MyLabel: UILabel {
    init(_ text: String, size: CGFloat, weight: UIFont.Weight) {
        super.init(frame: .zero)
        
        self.text = text
        textColor = .white
        font = UIFont.systemFont(ofSize: size, weight: weight)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class IconButton: UIButton {
    init(icon: UIImage) {
        super.init(frame: .zero)
        
        clipsToBounds = false
        layer.cornerRadius = 15
        backgroundColor = UIColor(red: 0.98, green: 0.60, blue: 0.23, alpha: 1.00)
        
        layer.borderWidth = 3
        layer.borderColor = UIColor(red: 0.96, green: 0.73, blue: 0.23, alpha: 1.00).cgColor // HEX #f6b93b
        layer.shadowColor = UIColor(red: 1.00, green: 0.98, blue: 0.40, alpha: 1.00).cgColor // HEX #fffa65
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        
        setImage(icon, for: .normal)
        imageView?.contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
