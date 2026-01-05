//
//  MainViewController.swift
//  whyRun
//
//  Created by 변예린 on 1/2/26.
//

import UIKit

class MainViewController: UIViewController {
    
    let kjh = Person(
        name: "👑김주희",
        vc: MemberADetailViewController(),
        img: .kjhAvatar,
        color: #colorLiteral(red: 0.7098039216, green: 0.5764705882, blue: 0.9764705882, alpha: 1)
    )
    let byr = Person(
        name: "변예린",
        vc: YerinViewController(),
        img: .byrAvatar,
        color: #colorLiteral(red: 0.9887660146, green: 0.9171475768, blue: 0.5723444819, alpha: 1)
    )
    let jys = Person(
        name: "장예슬",
        vc: YSMainViewController(),
        img: .jysAvatar,
        color: #colorLiteral(red: 0.7574192286, green: 0.7619019747, blue: 0.794529736, alpha: 1)
    )
    let hjh = Person(
        name: "한주헌",
        vc: HanMainViewController(),
        img: .hjhAvatar,
        color: #colorLiteral(red: 0.9498060346, green: 0.6782237887, blue: 0.9848874211, alpha: 1)
    )

    lazy var persons = [kjh, byr, jys, hjh]
    
    let kjhButton = CircularButton()
    let byrButton = CircularButton()
    let jysButton = CircularButton()
    let hjhButton = CircularButton()
    lazy var personalButtons = [kjhButton, byrButton, jysButton, hjhButton]
    
    let logoLabel = UILabel()
    let teamNameLabel = UILabel()
    let teamGoalLabel = UILabel()
    let teamInfoLabel = UILabel()
    
    private let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setButtonAction()
    }

    //MARK: UI 설정
    // UI 셋업 설정
    func setUI() {
        view.backgroundColor = .white
        
        setLabels()
        setScrollView()
        setPersonalButtons()
        
        let teamLabels = stackView([logoLabel, teamNameLabel, teamGoalLabel], axis: .vertical, spacing: 0)
        teamLabels.alignment = .center
        
        let firstButtonStack = stackView([kjhButton, byrButton], axis: .horizontal)
        let secondButtonStack = stackView([jysButton, hjhButton], axis: .horizontal)
        
//        firstButtonStack.distribution = .equalSpacing
//        secondButtonStack.distribution = .equalSpacing
        
        let buttonStack = stackView([firstButtonStack, secondButtonStack], axis: .vertical)

        view.addSubview(teamLabels)
        view.addSubview(scrollView)
        view.addSubview(buttonStack)
        
        teamLabels.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        firstButtonStack.translatesAutoresizingMaskIntoConstraints = false
        secondButtonStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            teamLabels.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            teamLabels.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            teamLabels.heightAnchor.constraint(equalToConstant: 160),
            
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.topAnchor.constraint(equalTo: teamLabels.bottomAnchor, constant: 15),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -30),
            scrollView.heightAnchor.constraint(equalTo: teamLabels.heightAnchor, multiplier: 1.1),
            
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStack.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20),
            buttonStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
//            buttonStack.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -30),
            
            buttonStack.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            buttonStack.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15)
            
        ])
        
//         버튼 높이 buttonStack과 동일화
//        personalButtons.forEach {
//            $0.widthAnchor.constraint(lessThanOrEqualTo: firstButtonStack.heightAnchor).isActive = true
//        }
    }

    // 레이블 설정
    func setLabels() {
        logoLabel.text = "🧐"
        logoLabel.font = .systemFont(ofSize: 72)

        teamNameLabel.text = "왜_되는지_모름"
        teamNameLabel.font = .systemFont(ofSize: 40, weight: .bold)

        teamGoalLabel.text = "왜 되는지 알게되는 그날까지 디버깅!"
        teamGoalLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        teamGoalLabel.textColor = .darkGray
        
        teamInfoLabel.numberOfLines = 0
        teamInfoLabel.lineBreakMode = .byWordWrapping
        teamInfoLabel.text = """
            ❮고정 일정❯
            🕖 데일리 스크럼 - 10:00, 14:00, 19:30
            🍚 점심 식사 - 13:00 ~ 14:00
            🍚 저녁 식사 - 18:00 ~ 19:00
            
            ❮규칙❯
            - ✨feat: 기능 추가
            - ♻️refactor: 기능과 관련된 개선/전면수정
            - ✅test: 테스트 추가
            - 🩹chore: 네이밍, 컨벤션 등 수정
            - 🐛fix: 오류 수정
            - 📝docs: 문서 추가 및 수정
            - 🚚build: 파일 이동 및 추가
            """
        teamInfoLabel.font = .systemFont(ofSize: 16, weight: .medium)
        teamInfoLabel.textColor = .black
    }
    
    func setPersonalButtons() {
        personalButtons.enumerated().forEach {
            $1.setImage(persons[$0].img.resized(to: CGSize(width: 80, height: 80)), for: .normal)
            $1.setTitle(persons[$0].name, for: .normal)
            $1.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
            $1.setTitleColor(.black, for: .normal)
            $1.backgroundColor = persons[$0].color
            
            $1.contentHorizontalAlignment = .center
            $1.contentVerticalAlignment = .center
        }
    }
    
    //스크롤뷰 설정
    func setScrollView() {
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        scrollView.layer.cornerRadius = 10
        
        scrollView.addSubview(teamInfoLabel)
        teamInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            teamInfoLabel.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 15),
            teamInfoLabel.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 15),
            teamInfoLabel.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -15),
            teamInfoLabel.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -15),
            
            teamInfoLabel.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, constant: -30)
        ])
    }
    
    // 스택뷰 생성
    func stackView(_ views: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat = 10) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: views)
        stack.axis = axis
        stack.spacing = spacing
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }
    
    //MARK: 동작 설정
    // 버튼 액션 설정
    func setButtonAction() {
        personalButtons.forEach {
            $0.addTarget(self, action: #selector(navigateTo), for: .touchUpInside)
        }
    }
    
    // 각 vc로 이동
    @objc private func navigateTo(_ sender: UIButton) {
        guard let name = sender.currentTitle else { return }
    
        if let person = persons.first(where: { $0.name == name}) {
            navigationController?.pushViewController(person.vc, animated: true)
        }
    }
}

//MARK: 커스텀 객체
struct Person {
    let name: String
    let vc: UIViewController
    let img: UIImage
    let color: UIColor
}

// 원형 버튼
class CircularButton: UIButton {
    
    private var aspectConstraint: NSLayoutConstraint? // 변수 x
    
    init() {
        super.init(frame: .zero)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    // 원 넓이 높이 동일화
    private func setConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: widthAnchor)
            .priority = .required
        heightAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = min(bounds.height, bounds.width) / 2
        clipsToBounds = true
    }
}

// 이미지 리사이징
extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        UIGraphicsImageRenderer(size: size).image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
