//
//  MainViewController.swift
//  whyRun
//
//  Created by 변예린 on 1/2/26.
//

import UIKit

class MainViewController: UIViewController {
    
    enum Person: String {
        case 김주희 = "김주희"
        case 변예린 = "변예린"
        case 장예슬 = "장예슬"
        case 한주헌 = "한주헌"
    }
    
    lazy var kjhButton = NavButton(to: Person.김주희.rawValue)
    lazy var byrButton = NavButton(to: Person.변예린.rawValue)
    lazy var jysButton = NavButton(to: Person.장예슬.rawValue)
    lazy var hjhButton = NavButton(to: Person.한주헌.rawValue)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setButtonAction()
    }
    
    //MARK: UI 설정
    // UI 셋업 설정
    func setUI() {
        view.backgroundColor = .white
        
        let firstButtonStack = stackView([kjhButton, byrButton], axis: .horizontal)
        let secondButtonStack = stackView([jysButton, hjhButton], axis: .horizontal)
        
        let buttons = stackView([firstButtonStack, secondButtonStack], axis: .vertical)
        
        view.addSubview(buttons)
        
        buttons.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttons.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    // 스택뷰 생성
    func stackView(_ views: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat = 10) -> UIStackView{
        let stack = UIStackView(arrangedSubviews: views)
        stack.axis = axis
        stack.spacing = spacing
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }
    
    //MARK: 액션 설정
    // 버튼 액션 설정
    func setButtonAction() {

        [kjhButton, byrButton, jysButton, hjhButton].forEach { (btn: NavButton) in
            btn.addTarget(self, action: #selector(navigateTo), for: .touchUpInside)
        }
    }
    
    @objc private func navigateTo(_ sender: NavButton) {
        var vc = UIViewController()
        guard let name = sender.currentTitle else { return }
        guard let person = Person(rawValue: name) else { return }
    
        switch person {
        case .김주희:
            vc = MemberADetailViewController()
        case .변예린:
            vc = YerinViewController()
        case .장예슬:
            vc = YSMainViewController()
        case .한주헌:
            vc = PageHan()
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: 커스텀 객체
class NavButton: UIButton {
    
    init(to page: String) {
        super.init(frame: .zero)
        
        setTitle(page, for: .normal)
        setTitleColor(.black, for: .normal)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 100),
            heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
