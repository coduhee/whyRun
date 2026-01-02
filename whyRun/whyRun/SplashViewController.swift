//
//  SplashViewController.swift
//  whyRun
//
//  Created by Hanjuheon on 1/2/26.
//


import UIKit

class SplashViewCotroller : UIViewController {
    

    
    let labelLogo : UILabel = {
        let label = UILabel()
        label.text = "🧐"
        label.font = UIFont.systemFont(ofSize: 150, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0.0
        return label
    }()
    
    let labelName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "whyRun"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 80, weight: .bold)
        label.alpha = 0.0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 10/255, green: 110/255, blue: 200/255, alpha: 1.0)
        
        
        let vStackViewMain = UIStackView()
        vStackViewMain.axis = .vertical
        vStackViewMain.translatesAutoresizingMaskIntoConstraints = false
        vStackViewMain.alignment = .center
        vStackViewMain.spacing = 20
        vStackViewMain.alpha = 1.0
        vStackViewMain.backgroundColor = UIColor(red: 10/255, green: 110/255, blue: 200/255, alpha: 1.0)
        
        vStackViewMain.addArrangedSubview(labelLogo)
        vStackViewMain.addArrangedSubview(labelName)
        view.addSubview(vStackViewMain)
        
        animateToLogo()
        
        NSLayoutConstraint.activate([
            vStackViewMain.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStackViewMain.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        ])
    }
    
    func animateToLogo()
    {
        UIView.animate(withDuration: 1.0){
            self.labelLogo.alpha = 1.0
            self.labelName.alpha = 1.0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.moveToMainView()
        }
    }
    
    func moveToMainView()
    {
        // 메인화면 생성
        let mainVC = MainViewController()
        // 메인화면을 root로하는 네비게이션 생성
        let mainNav = UINavigationController(rootViewController: mainVC)
        
        // 앱에 연결된 Scene 중 화면을 담당하는 UIWindowScene 선택
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let window = windowScene.windows.first
            {
                // 윈도우의 루트 컨트롤을 mainNav로 변경
                window.rootViewController = mainNav
                // 활성화하여 화면에 표시
                window.makeKeyAndVisible()
            }
    }
}

#Preview
{
    SplashViewCotroller()
}
