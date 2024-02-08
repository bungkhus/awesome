//
//  HomeCell.swift
//  Awesome
//
//  Created by Lion Parcel on 08/02/24.
//

import UIKit
import SnapKit

class HomeCell: UITableViewCell {
    
    var model: HomeModel? {
        didSet {
            updateUI()
        }
    }
    
    private lazy var avengerImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var nameLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 14)
        $0.textColor = .black
    }
    
    private lazy var starLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
    }
    
    private lazy var hStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .leading
    }
    
    private lazy var vStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 15
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    private func configureView() {
        addSubview(hStackView)
        
        [avengerImageView, vStackView].forEach { [weak self] in
            self?.hStackView.addArrangedSubview($0)
        }
        [nameLabel, starLabel].forEach { [weak self] in
            self?.vStackView.addArrangedSubview($0)
        }
        
        hStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.bottom.equalToSuperview().inset(10)
        }
        avengerImageView.snp.makeConstraints {
            $0.height.width.equalTo(50)
        }
    }
    
    private func updateUI() {
        guard let model = self.model else { return }
        
        avengerImageView.image = UIImage(named: model.image)
        nameLabel.text = model.name
        starLabel.text = model.star
    }

}
