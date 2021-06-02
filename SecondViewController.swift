//
//  SecondViewController.swift
//  HalfVCTest
//
//  Created by kakao on 2021/06/02.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func secondVCButtonDidTap()
}

class SecondViewController: UIViewController {
    
    weak var delegate: SecondViewControllerDelegate?
    
    private lazy var button: UIButton = {
        let bt: UIButton = .init(type: .system)
        bt.backgroundColor = .red
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        return bt
    }()
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .allButUpsideDown
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .green
        
        // 아래를 여기서 수행하면 회전시 뷰가 이상하게 노출됨. 반드시 containerViewWillLayoutSubviews 에서 해줘야 함.
        //self.view.add(roundedCorners: [.topLeft, .topRight], with: CGSize(width: 12, height: 12))
        
        self.view.addSubview(button)
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc private func buttonDidTap() {
        delegate?.secondVCButtonDidTap()
    }
}
