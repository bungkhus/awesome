//
//  ViewController.swift
//  Awesome
//
//  Created by Lion Parcel on 08/02/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var awesomeLabel = UILabel().then {
        $0.text = "AWESOME"
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    private lazy var byLabel = UILabel().then {
        $0.text = "by Muhammad Khusnan"
    }
    
    private lazy var stackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.present(to: UINavigationController(rootViewController: HomeViewController()))
        }
    }

    private func configureView() {
        view.addSubview(stackView)
        [awesomeLabel, byLabel].forEach { [weak self] in
            self?.stackView.addArrangedSubview($0)
        }
        
        stackView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }

}

