//
//  MainViewController.swift
//  whyRun
//
//  Created by Yeseul Jang on 12/30/25.
//
import UIKit

class MainViewController: UIViewController {
    
    let showSheetButton = UIButton()
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupBackGround()
        setupButton()
        setupConstraint()
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
        showSheetButton.setTitle("📍", for: .normal)
        showSheetButton.titleLabel?.font = .systemFont(ofSize: 60, weight: .thin)
        showSheetButton.addTarget(self, action: #selector(tapShowButton), for: .touchUpInside)
    }
    
    func setupConstraint() {
        view.addSubview(showSheetButton)
        showSheetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            showSheetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showSheetButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func tapShowButton() {
        let sheetViewController = SheetViewController()
        sheetViewController.modalPresentationStyle = .pageSheet
        
        if let sheet = sheetViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            
            if #available(iOS 16.0, *) {
                sheet.selectedDetentIdentifier = .medium
            }
        }
        present(sheetViewController, animated: true)
    }
}
