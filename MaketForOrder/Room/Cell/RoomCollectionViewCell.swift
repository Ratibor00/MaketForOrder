//
//  RoomCollectionViewCell.swift
//  MaketForOrder
//
//  Created by Ratibor on 27.12.2023.
//

import UIKit
import SnapKit

class RoomCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private properties
    private var roomData: Room?
    
    let imageSetupView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    // MARK: - Public methods
    func configure(with imageUrl: String) {
        if let url = URL(string: imageUrl) {
            let configuration = URLSessionConfiguration.ephemeral
            let session = URLSession(configuration: configuration)
            
            session.dataTask(with: url) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imageSetupView.image = image
                    }
                } else {
                    DispatchQueue.main.async {
                        self.imageSetupView.image = UIImage(named: "404")
                    }
                }
            }.resume()
        } else {
            self.imageSetupView.image = UIImage(named: "404")
        }
    }
}

// MARK: - Private methods
private extension RoomCollectionViewCell {
    func setupUI() {
        setupImageView()
    }
    
    func setupImageView() {
        contentView.addSubview(imageSetupView)
        imageSetupView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(257)
        }
    }
}
