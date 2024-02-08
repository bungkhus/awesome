//
//  DetailViewController.swift
//  Awesome
//
//  Created by Lion Parcel on 08/02/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var onUpdateStar: ((StarEnum) -> Void)?
    
    private let viewModel = DetailViewModel()
    
    private lazy var avengerImageView = UIImageView()
    
    private lazy var vStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 20
    }
    
    private lazy var hStackView = UIStackView().then {
        $0.axis = .horizontal
    }
    
    private lazy var buttonStar1 = UIButton(type: .custom).then {
        $0.setTitle("", for: .normal)
        $0.setImage(.filledStar, for: .normal)
        $0.addTarget(self, action: #selector(onTapStar(_:)), for: .touchUpInside)
    }
    
    private lazy var buttonStar2 = UIButton(type: .custom).then {
        $0.setTitle("", for: .normal)
        $0.setImage(.emptyStar, for: .normal)
        $0.addTarget(self, action: #selector(onTapStar(_:)), for: .touchUpInside)
    }
    
    private lazy var buttonStar3 = UIButton(type: .custom).then {
        $0.setTitle("", for: .normal)
        $0.setImage(.emptyStar, for: .normal)
        $0.addTarget(self, action: #selector(onTapStar(_:)), for: .touchUpInside)
    }
    
    init(with model: HomeModel) {
        self.viewModel.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    private func configureView() {
        self.title = viewModel.model.name
        self.navigationController?.navigationBar.backIndicatorImage = .back
        //self.navigationController?.navigationBar.backIndicatorTransitionMaskImage =
        self.view.backgroundColor = .white
        self.view.addSubview(vStackView)
        
        [avengerImageView, hStackView].forEach { [weak self] in
            self?.vStackView.addArrangedSubview($0)
        }
        [buttonStar1, buttonStar2, buttonStar3].forEach { [weak self] in
            self?.hStackView.addArrangedSubview($0)
            
            $0.snp.makeConstraints {
                $0.height.width.equalTo(50)
            }
        }
        
        let topInset: CGFloat = UIScreen.main.bounds.size.height >= 812 ? 100 : 66
        
        vStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(topInset)
            $0.leading.trailing.equalToSuperview()
        }
        
        let width = UIScreen.main.bounds.width
        avengerImageView.snp.makeConstraints {
            $0.width.equalTo(width)
            $0.height.equalTo(width * 1.5)
        }
        
        self.updateUI()
    }
    
    private func updateUI() {
        guard let model = viewModel.model else { return }
        
        avengerImageView.image = model.image
        
        switch model.star {
        case .normal:
            self.buttonStar2.setImage(.emptyStar, for: .normal)
            self.buttonStar3.setImage(.emptyStar, for: .normal)
        case .veryGood:
            self.buttonStar2.setImage(.filledStar, for: .normal)
            self.buttonStar3.setImage(.emptyStar, for: .normal)
        case .awesome:
            self.buttonStar2.setImage(.filledStar, for: .normal)
            self.buttonStar3.setImage(.filledStar, for: .normal)
        }
    }
    
    @objc private func onTapStar(_ sender: UIButton) {
        switch sender {
        case buttonStar1:
            self.buttonStar2.setImage(.emptyStar, for: .normal)
            self.buttonStar3.setImage(.emptyStar, for: .normal)
            self.onUpdateStar?(.normal)
        case buttonStar2:
            if self.buttonStar3.image(for: .normal) == .filledStar {
                
            } else if sender.image(for: .normal) == .filledStar {
                sender.setImage(.emptyStar, for: .normal)
                self.onUpdateStar?(.normal)
            } else {
                sender.setImage(.filledStar, for: .normal)
                self.onUpdateStar?(.veryGood)
            }
            self.buttonStar3.setImage(.emptyStar, for: .normal)
        case buttonStar3:
            self.buttonStar2.setImage(.filledStar, for: .normal)
            if sender.image(for: .normal) == .filledStar {
                sender.setImage(.emptyStar, for: .normal)
                self.onUpdateStar?(.veryGood)
            } else {
                sender.setImage(.filledStar, for: .normal)
                self.onUpdateStar?(.awesome)
            }
        default:
            break
        }
    }

}
