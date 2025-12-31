//
//  MainViewController.swift
//  whyRun
//
//  Created by Yeseul Jang on 12/30/25.
//
import UIKit

class YSMainViewController: UIViewController {
    let showSheetButton = UIButton()
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupBackGround()
        setupButton()
        configureShowSheetButton()
    }
    
    func setupBackGround() {
        backgroundImageView.image = UIImage(named: "YS")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        
        view.addSubview(backgroundImageView)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupButton() {
        showSheetButton.setImage(UIImage(named: "YSpointer"), for: .normal)
        showSheetButton.addTarget(self, action: #selector(tapShowButton), for: .touchUpInside)
    }
    
    func configureShowSheetButton() {
        view.addSubview(showSheetButton)
        showSheetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            showSheetButton.widthAnchor.constraint(equalToConstant: 50),
            showSheetButton.heightAnchor.constraint(equalToConstant: 50),
            showSheetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showSheetButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height * 0.19)
        ])
    }
    
    @objc func tapShowButton() {
        let sheetViewController = YSSheetViewController()
        sheetViewController.modalPresentationStyle = .pageSheet
        
        if let sheet = sheetViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }
        present(sheetViewController, animated: true)
    }
}
