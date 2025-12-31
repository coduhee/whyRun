//
//  YerinViewController.swift
//  whyRun
//
//  Created by 변예린 on 12/30/25.
//

import UIKit
import SafariServices

class YerinViewController: UIViewController {
    //MARK: 속성 선언
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
        let styles = UIStackView(arrangedSubviews: ["팔로워", "경청", "호기심"].map{ PillView($0) })
        
        keywords.spacing = 5
        styles.spacing = 5
        
        let first = UIStackView(arrangedSubviews: [MyLabel("나의 키워드", size: 22, weight: .bold), keywords])
        let second = UIStackView(arrangedSubviews: [MyLabel("나의 스타일", size: 22, weight: .bold), styles])
        let third = UIStackView(arrangedSubviews: [MyLabel("나의 한마디", size: 22, weight: .bold), MyLabel("iOS 개발자로 먹고 살 수 있는 날까지 화이팅!!", size: 18, weight: .semibold)])
        
        [first, second, third].forEach {
            $0.axis = .vertical
            $0.spacing = 6
            $0.alignment = .trailing
        }
        
        let stackView = UIStackView(arrangedSubviews: [first, second, third])
        
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .trailing
        
        return stackView
    }()
    
    let characterBackgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.2)
        view.layer.cornerRadius = 10
        return view
    }()
   
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.19, green: 0.22, blue: 0.32, alpha: 1.00) // HEX #303952
        setUI() // 기초 UI 설정
        
        setButtonActions() // 버튼 액션 설정
    }
    
    //MARK: UI 설정
    
    // 프로필 이미지 크기 변경
    override func viewDidLayoutSubviews() {
        profileImage.contentMode = .scaleAspectFit
        profileImage.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    }
    
    // 기초 UI 셋업
    func setUI() {
        // 여백을 위한 레이아웃 가이드 설정
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
        
        // 오토레이아웃 설정
        view.addSubview(profileImage)
        view.addSubview(labelSet)
        view.addSubview(characterBackgroundView)
        view.addSubview(ButtonSetBackgroundView)
        
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
        
        // 하위 뷰 설정
        setCharacteristics()
    }
    
    func setCharacteristics() {
        characterBackgroundView.addSubview(characteristics)
        characteristics.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characteristics.centerYAnchor.constraint(equalTo: characterBackgroundView.centerYAnchor),
            characteristics.trailingAnchor.constraint(equalTo: characterBackgroundView.trailingAnchor, constant: -15)
        ])
    }
    
    

    
    //MARK: 버튼 기능 구현
    func setButtonActions() {
        blogButton.addTarget(self, action: #selector(blogButtonPushed), for: .touchUpInside)
        petButton.addTarget(self, action: #selector(petButtonPushed), for: .touchUpInside)
    }
    
    // 블로그 버튼 액션
    @objc func blogButtonPushed() {
        let url = URL(string: "https://velog.io/@bambu113/posts")
        let blogSafariView: SFSafariViewController = SFSafariViewController(url: url!)
        self.present(blogSafariView, animated: true , completion: nil)
        print("petButton pushed")
    }
    
    // 펫 버튼 액션
    @objc func petButtonPushed() {
        let vc = PetCardViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
}

//MARK: 커스텀 객체

// 레이블
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

// 아이콘 버튼
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

// 캡슐 모양 뷰
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

// 반려동물 카드 VC
final class PetCardViewController: UIViewController {
    
    // 배경 반투명 뷰
   let dimView: UIView = {
        let view = UIView()
       view.backgroundColor = .black.withAlphaComponent(0.5)
        return view
    }()
    
    // 카드 콘텐츠 배경 뷰
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.clipsToBounds = true // 카드 밖으로 컨텐츠가 나갔을 때 카드 모양대로 자르기 위한 제한
        
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor(red: 0.96, green: 0.73, blue: 0.23, alpha: 1.00).cgColor // HEX #f6b93b

        return view
    }()
    
    private let shadowView: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor(red: 1.00, green: 0.98, blue: 0.40, alpha: 1.00).cgColor // HEX #fffa65
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = .zero
        return view
    }()
    
    // 콘텐츠
    private let content: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setContent()
        setDismiss()
    }
    
    func setupLayout() {
        view.addSubview(dimView)
        dimView.frame = view.bounds

        view.addSubview(shadowView)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        
        shadowView.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            shadowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            shadowView.widthAnchor.constraint(equalToConstant: 280),
            
            cardView.topAnchor.constraint(equalTo: shadowView.topAnchor),
            cardView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor),
            cardView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor)
        ])
        // height는 콘텐츠 길이에 따라 가변
    }

    func setContent() {
        setContentUI()
        cardView.addSubview(content)
        content.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            content.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
            content.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            content.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20)
            ])
    }
    
    
    func setContentUI() {
        let img = UIImageView(image: .yerinPet)
        
        let name = MyLabel("짜코", size: 24, weight: .bold, color: .black)
        let lv = MyLabel("Lv.1 크레스티드 게코", size: 19, weight: .medium, color: .black)
        let fav: UIStackView = {
            let title = MyLabel("좋아하는 것:", size: 19, weight: .bold, color: .black)
            let ans = MyLabel("사료, 홍시", size: 19, weight: .medium, color: .black)
            
            let stackView = UIStackView(arrangedSubviews: [title, ans])
            stackView.axis = .horizontal
            stackView.spacing = 6
            return stackView
        }()
        let hate: UIStackView = {
            let title = MyLabel("싫어하는 것:", size: 19, weight: .bold, color: .black)
            let ans = MyLabel("사람", size: 19, weight: .medium, color: .black)
            
            let stackView = UIStackView(arrangedSubviews: [title, ans])
            stackView.axis = .horizontal
            stackView.spacing = 6
            return stackView
        }()

        let texts: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [name, lv, fav, hate])
            stackView.axis = .vertical
            stackView.spacing = 10
            stackView.alignment = .center
            return stackView
        }()
        
        content.addSubview(img)
        content.addSubview(texts)
        
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        
        texts.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            img.widthAnchor.constraint(equalToConstant: 150),
            img.heightAnchor.constraint(equalToConstant: 180),
            img.centerXAnchor.constraint(equalTo: content.centerXAnchor),
            img.topAnchor.constraint(equalTo: content.topAnchor),
            
            texts.centerXAnchor.constraint(equalTo: content.centerXAnchor),
            texts.topAnchor.constraint(equalTo: img.bottomAnchor),
            texts.leadingAnchor.constraint(equalTo: content.leadingAnchor),
            texts.trailingAnchor.constraint(equalTo: content.trailingAnchor),
            texts.bottomAnchor.constraint(equalTo: content.bottomAnchor)
        ])
    }
    
    func setDismiss() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(close))
        dimView.addGestureRecognizer(tap)
    }
    
    @objc func close() {
        dismiss(animated: true)
    }
}
