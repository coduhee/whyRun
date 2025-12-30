//
//  MainViewController.swift
//  whyRun
//
//  Created by Yeseul Jang on 12/30/25.
//
import UIKit

class MainViewController: UIViewController {
    
    let showSheetButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "메인뷰"
        
        setupButton()
        setupConstraint()
    }
    
    func setupButton() {
        showSheetButton.setTitle("📍", for: .normal)
        showSheetButton.titleLabel?.font = .systemFont(ofSize: 40, weight: .thin)
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
