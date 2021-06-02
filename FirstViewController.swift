//
//  ViewController.swift
//  HalfVCTest
//
//  Created by kakao on 2021/06/02.
//

import UIKit

class FirstViewController: UIViewController {

    private lazy var captureOptionTransitionDelegate: CaptureOptionTransitionDelegate = {
        return .init()
    }()
    
    private lazy var button: UIButton = {
        let bt: UIButton = .init(type: .system)
        bt.backgroundColor = .blue
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        return bt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(button)
        button.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        button.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    @objc func buttonDidTap() {
        let secondVC: SecondViewController = .init()
        secondVC.transitioningDelegate = self.captureOptionTransitionDelegate
        secondVC.delegate = self
        secondVC.modalPresentationStyle = .custom
        present(secondVC, animated: true, completion: nil)
    }
}

extension FirstViewController: SecondViewControllerDelegate {
    func secondVCButtonDidTap() {
        print("secondVC button did Tap")
    }
}
