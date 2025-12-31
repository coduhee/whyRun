//
//  YerinViewController.swift
//  whyRun
//
//  Created by 변예린 on 12/30/25.
//

import UIKit
import SafariServices

class YerinViewController: UIViewController {
    // 속성 선언
    let profileImage = UIImageView(image: .yerinProfile)
    let petImage = UIImageView(image: .yerinPet)
    
    let mbtiLabel = MyLabel("INTP", size: 17, weight: .medium)
    let nameLabel = MyLabel("변예린", size: 25, weight: .bold)
    let levelLabel = MyLabel("Lv.28", size: 17, weight: .bold)
    let jobLabel = MyLabel("백수", size: 17, weight: .medium)

    // 레이블 stackView
    lazy var descriptionLabel: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [levelLabel, jobLabel])
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

    // 버튼 stackView
    let petButton = IconButton(icon: .yerinPetIcon)
    let petLabel = MyLabel("펫: 짜코", size: 15, weight: .semibold, color: UIColor(red: 0.97, green: 0.84, blue: 0.58, alpha: 1.00))
    let blogButton = IconButton(icon: .yerinBlogIcon)
    let blogLabel = MyLabel("블로그", size: 15, weight: .semibold, color: UIColor(red: 0.97, green: 0.84, blue: 0.58, alpha: 1.00))
    
    lazy var buttonSet: UIStackView = {
        let petStack = UIStackView(arrangedSubviews: [petButton, petLabel])
        let blogStack = UIStackView(arrangedSubviews: [blogButton, blogLabel])
        [petStack, blogStack].forEach {
            $0.axis = .vertical
            $0.spacing = 6
            $0.alignment = .center
        }
        
        let stackView = UIStackView(arrangedSubviews: [petStack, blogStack])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var ButtonSetBackgroundView: UIView = {
        let view = UIView()
//        view.backgroundColor = UIColor(red: 0.13, green: 0.18, blue: 0.24, alpha: 1.00) // HEX #222f3e
        view.backgroundColor = UIColor(red: 0.18, green: 0.21, blue: 0.25, alpha: 1.00) // HEX #2f3640
        view.layer.cornerRadius = 15
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(buttonSet)
        
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalTo: buttonSet.widthAnchor, multiplier: 1.4),
            view.heightAnchor.constraint(equalTo: buttonSet.heightAnchor, multiplier: 1.4),
            
            buttonSet.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonSet.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 5)
        ])
        
        return view
    }()
    
    // 특징 레이블 stackView
    let characteristics: UIStackView = {
        let keywords = UIStackView(arrangedSubviews: ["성실함", "친구들의 상담사", "취미부자"].map{ PillView($0) })
        let goals = UIStackView(arrangedSubviews: ["iOS 개발자", "취업", "자취"].map{ PillView($0) })
        
        keywords.spacing = 5
        goals.spacing = 5
        
        let stackView = UIStackView(arrangedSubviews: [
            MyLabel("나의 키워드", size: 20, weight: .bold),
            keywords,
            MyLabel("나의 목표", size: 20, weight: .bold),
            goals,
            MyLabel("한 줄 메시지", size: 20, weight: .bold),
            MyLabel("코드가 왜 되는지 알게되는 그날까지 화이팅!", size: 18, weight: .medium)
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .trailing
        
        return stackView
    }()
    
    let characterBackgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.2)
        view.layer.cornerRadius = 10
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    //MARK: UI 셋업
    func setUI() {
        let cutGuide = UILayoutGuide()
        view.addLayoutGuide(cutGuide)
        
        let insetGuide = UILayoutGuide()
        view.addLayoutGuide(insetGuide)
        
        NSLayoutConstraint.activate([
            cutGuide.trailingAnchor.constraint(equalTo: view.leadingAnchor),
            cutGuide.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            
            insetGuide.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            insetGuide.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.9),
            
            insetGuide.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            insetGuide.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        
        view.backgroundColor = UIColor(red: 0.19, green: 0.22, blue: 0.32, alpha: 1.00) // HEX #303952
        
        view.addSubview(profileImage)
        view.addSubview(labelSet)
//        view.addSubview(buttonSet)
        view.addSubview(characterBackgroundView)
        view.addSubview(ButtonSetBackgroundView)

        profileImage.contentMode = .scaleAspectFit
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        labelSet.translatesAutoresizingMaskIntoConstraints = false
        buttonSet.translatesAutoresizingMaskIntoConstraints = false
        characterBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            profileImage.leadingAnchor.constraint(equalTo: cutGuide.leadingAnchor),
            profileImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            labelSet.bottomAnchor.constraint(equalTo: profileImage.topAnchor, constant: -24),
            labelSet.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor, constant: -15),

            ButtonSetBackgroundView.topAnchor.constraint(equalTo: labelSet.topAnchor),
            ButtonSetBackgroundView.leadingAnchor.constraint(equalTo: labelSet.trailingAnchor, constant: 40),
           
            characterBackgroundView.topAnchor.constraint(equalTo: insetGuide.topAnchor),
            characterBackgroundView.leadingAnchor.constraint(equalTo: insetGuide.leadingAnchor),
            characterBackgroundView.trailingAnchor.constraint(equalTo: insetGuide.trailingAnchor),
            characterBackgroundView.bottomAnchor.constraint(equalTo: labelSet.topAnchor, constant: -20),
            ])
        
        setCharacteristics()
        
        blogButton.addTarget(self, action: #selector(blogButtonPushed), for: .touchUpInside)
    }
    
    func setCharacteristics() {
        characterBackgroundView.addSubview(characteristics)
        characteristics.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characteristics.centerYAnchor.constraint(equalTo: characterBackgroundView.centerYAnchor),
            characteristics.trailingAnchor.constraint(equalTo: characterBackgroundView.trailingAnchor, constant: -15)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        profileImage.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    }
    
    // 버튼 기능
    @objc func blogButtonPushed() {
        let url = URL(string: "https://velog.io/@bambu113/posts")
        let blogSafariView: SFSafariViewController = SFSafariViewController(url: url!)
        self.present(blogSafariView, animated: true , completion: nil)
        print("petButton pushed")
    }
    
}

//MARK: 커스텀 객체
class MyLabel: UILabel {
    init(_ text: String, size: CGFloat, weight: UIFont.Weight, color: UIColor = .white) {
        super.init(frame: .zero)
        
        self.text = text
        textColor = color
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
        backgroundColor = UIColor(red: 0.97, green: 0.84, blue: 0.58, alpha: 1.00) // HEX #F7D694
        
        // 테두리 및 그림자 설정
        layer.borderWidth = 3
        layer.borderColor = UIColor(red: 0.96, green: 0.73, blue: 0.23, alpha: 1.00).cgColor // HEX #f6b93b
        layer.shadowColor = UIColor(red: 1.00, green: 0.98, blue: 0.40, alpha: 1.00).cgColor // HEX #fffa65
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        
        // 버튼 이미지 설정
        setImage(icon, for: .normal)
        imageView?.contentMode = .scaleAspectFit // 이미지 비율 유지
        
        // 버튼 크기 설정
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 65),
            widthAnchor.constraint(equalToConstant: 65)
        ])
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
        
        // 텍스트 여백(padding) 설정
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
