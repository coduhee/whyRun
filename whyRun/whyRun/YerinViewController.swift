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
        let stackView = UIStackView(arrangedSubviews: [mbtiLabel, nameLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.alignment = .center
        return stackView
    }()

    let petButton = IconButton(icon: .yerinPetIcon)
    let blogButton = IconButton(icon: .yerinBlogIcon)
    
    lazy var buttonSet: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [petButton, blogButton])
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    let characteristics: UIStackView = {
        let stackView = UIStackView()
        
        let first = ["성실함", "친구들의 상담사", "취미부자"].map{ PillView($0) }
        
        let labels = [
            MyLabel("나의 키워드", size: 20, weight: .bold),
            MyLabel("...", size: 18, weight: .medium),
            MyLabel("나의 목표", size: 20, weight: .bold),
            MyLabel("...", size: 18, weight: .medium),
            MyLabel("한 줄 메시지", size: 20, weight: .bold),
            MyLabel("...", size: 18, weight: .medium)
        ]
        
        labels.forEach { stackView.addArrangedSubview( $0 ) }
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .trailing
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    //MARK: UI 셋업
    func setUI() {
        let a = PillView("성실함")
        a.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = UIColor(red: 0.19, green: 0.22, blue: 0.32, alpha: 1.00) // HEX #303952
        
        view.addSubview(profileImage)
        view.addSubview(labelSet)
        view.addSubview(buttonSet)
        view.addSubview(characteristics)
        view.addSubview(a)

        
        profileImage.contentMode = .scaleAspectFit
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        labelSet.translatesAutoresizingMaskIntoConstraints = false
        petButton.translatesAutoresizingMaskIntoConstraints = false
        blogButton.translatesAutoresizingMaskIntoConstraints = false
        buttonSet.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            a.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            profileImage.widthAnchor.constraint(equalToConstant: (profileImage.image?.size.width ?? 0) * 1.1),
            profileImage.heightAnchor.constraint(equalToConstant: (profileImage.image?.size.height ?? 0) * 1.1),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -(view.frame.width * 0.1)),
            profileImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            labelSet.bottomAnchor.constraint(equalTo: profileImage.topAnchor, constant: -20),
            labelSet.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor, constant: -(profileImage.frame.width / 2 * 0.15)),
            
            petButton.widthAnchor.constraint(equalToConstant: 65),
            petButton.heightAnchor.constraint(equalToConstant: 65),
            blogButton.widthAnchor.constraint(equalToConstant: 65),
            blogButton.heightAnchor.constraint(equalToConstant: 65),
            
            buttonSet.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 20),
            buttonSet.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -(view.frame.width * 0.1))
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
        textAlignment = .center
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
        backgroundColor = UIColor(red: 0.97, green: 0.84, blue: 0.58, alpha: 1.00)
        
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

class PillView: UIView {
    init(_ text: String) {
        super.init(frame: .zero)
        
        let label = MyLabel(text, size: 18, weight: .bold)
        
        backgroundColor = UIColor(white: 1, alpha: 0.3)
        layer.masksToBounds = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 30),
            
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
