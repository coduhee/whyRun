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
    
    let mbtiLabel = UILabel()
    let nameLabel = UILabel()
    let levelLabel = UILabel()
    let jobLabel = UILabel()

    let petButton = IconButton(icon: .yerinPetIcon)
    let petLabel = UILabel()
    let blogButton = IconButton(icon: .yerinBlogIcon)
    let blogLabel = UILabel()
    
    let keywords = ["성실함", "친구들의 상담사", "취미부자"]
    let styles = ["팔로워", "경청", "호기심"]
    let words = UILabel()

    let keywordLabel = UILabel()
    let styleLabel = UILabel()
    let wordLabel = UILabel()
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

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
        setLabels()
        
        view.backgroundColor = UIColor(red: 0.19, green: 0.22, blue: 0.32, alpha: 1.00) // HEX #303952
        
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
        
        let myLabelSet = setMyLabelStack()
        let buttonView = setButtonView()
        let characterView = setCharacterView()
        
        // 오토레이아웃 설정
        view.addSubview(profileImage)
        view.addSubview(myLabelSet)
        view.addSubview(characterView)
        view.addSubview(buttonView)
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        myLabelSet.translatesAutoresizingMaskIntoConstraints = false
        characterView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            profileImage.leadingAnchor.constraint(equalTo: cutGuide.leadingAnchor),
            profileImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            myLabelSet.bottomAnchor.constraint(equalTo: profileImage.topAnchor, constant: -24),
            myLabelSet.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor, constant: -15),

            buttonView.topAnchor.constraint(equalTo: myLabelSet.topAnchor),
            buttonView.leadingAnchor.constraint(equalTo: myLabelSet.trailingAnchor, constant: 40),
           
            characterView.topAnchor.constraint(equalTo: insetGuide.topAnchor),
            characterView.leadingAnchor.constraint(equalTo: insetGuide.leadingAnchor),
            characterView.trailingAnchor.constraint(equalTo: insetGuide.trailingAnchor),
            characterView.bottomAnchor.constraint(equalTo: myLabelSet.topAnchor, constant: -20),
            ])
    }
    
    // 레이블 설정
    func setLabels() {
        // 텍스트 설정
        mbtiLabel.text = "INTP"
        mbtiLabel.font = .systemFont(ofSize: 17, weight: .medium)
        
        nameLabel.text = "변예린"
        nameLabel.font = .systemFont(ofSize: 25, weight: .bold)
        
        levelLabel.text = "Lv.29"
        levelLabel.font = .systemFont(ofSize: 17, weight: .bold)
        
        jobLabel.text = "백수"
        jobLabel.font = .systemFont(ofSize: 17, weight: .medium)
        
        petLabel.text = "펫: 짜코"
        petLabel.font = .systemFont(ofSize: 15, weight: .bold)

        blogLabel.text = "블로그"
        blogLabel.font = .systemFont(ofSize: 15, weight: .bold)
        
        keywordLabel.text = "나의 키워드"
        keywordLabel.font = .systemFont(ofSize: 22, weight: .bold)
        
        styleLabel.text = "나의 스타일"
        styleLabel.font = .systemFont(ofSize: 22, weight: .bold)
        
        wordLabel.text = "나의 한마디"
        wordLabel.font = .systemFont(ofSize: 22, weight: .bold)
        
        words.text = "iOS 개발자로 먹고 살 수 있는 날까지 화이팅!!"
        words.font = .systemFont(ofSize: 18, weight: .semibold)
        
        // 색상 설정
        let buttonLabelColor = UIColor(red: 0.97, green: 0.84, blue: 0.58, alpha: 1.00)
        
        [mbtiLabel, nameLabel, levelLabel, jobLabel, keywordLabel, styleLabel, wordLabel, words].forEach {
            $0.textColor = .white
        }
        [petLabel, blogLabel].forEach {
            $0.textColor = buttonLabelColor
        }
    }
    
    // 특징뷰(CharacterView) 설정
    func setCharacterView() -> UIView {
        let characterStack = setCharcterStack()
        
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.2)
        view.layer.cornerRadius = 10
        
        view.addSubview(characterStack)
        characterStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            characterStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
        
        return view
    }
    
    func setCharcterStack() -> UIStackView {
        let keywordStack = UIStackView(arrangedSubviews: keywords.map{ PillView($0) })
        let styleStack = UIStackView(arrangedSubviews: styles.map{ PillView($0) })
        
        keywordStack.spacing = 5
        styleStack.spacing = 5
        
        let first = UIStackView(arrangedSubviews: [keywordLabel, keywordStack])
        let second = UIStackView(arrangedSubviews: [styleLabel, styleStack])
        let third = UIStackView(arrangedSubviews: [wordLabel, words])
        
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
    }
    
    // '나'에 관련된 레이블 스택뷰(myLabelSet) 생성
    func setMyLabelStack() -> UIStackView {
        let descriptionLabel: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [levelLabel, jobLabel])
            stackView.axis = .horizontal
            stackView.spacing = 10
            return stackView
        }()
        
        let stackView = UIStackView(arrangedSubviews: [mbtiLabel, nameLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.alignment = .center
        return stackView
    }
    
    // 버튼 스택뷰 생성
    func setButtonStack() -> UIStackView {
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
    }
    
    // 버튼뷰 생성
    func setButtonView() -> UIView {
        let buttonSet = setButtonStack()
        let view = UIView()
        
        view.backgroundColor = UIColor(red: 0.18, green: 0.21, blue: 0.25, alpha: 1.00) // HEX #2f3640
        view.layer.cornerRadius = 15
        
        view.addSubview(buttonSet)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        buttonSet.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalTo: buttonSet.widthAnchor, multiplier: 1.4),
            view.heightAnchor.constraint(equalTo: buttonSet.heightAnchor, multiplier: 1.4),
            
            buttonSet.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonSet.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 5)
        ])
        return view
    }
}

//MARK: 버튼 기능 구현
extension YerinViewController {
    // 버튼 액션 설정
    func setButtonActions() {
        blogButton.addTarget(self, action: #selector(blogButtonPushed), for: .touchUpInside)
        petButton.addTarget(self, action: #selector(petButtonPushed), for: .touchUpInside)
    }
    
    // 블로그 버튼 액션
    @objc private func blogButtonPushed() {
        let url = URL(string: "https://velog.io/@bambu113/posts")
        let blogSafariView: SFSafariViewController = SFSafariViewController(url: url!)
        self.present(blogSafariView, animated: true , completion: nil)
    }
    
    // 펫 버튼 액션
    @objc private func petButtonPushed() {
        let vc = PetCardViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
}

//MARK: 커스텀 객체
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
        
        let label: UILabel = {
            let label = UILabel()
            label.text = text
            label.font = .systemFont(ofSize: 18, weight: .bold)
            label.textColor = .white
            return label
        }()
        
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

