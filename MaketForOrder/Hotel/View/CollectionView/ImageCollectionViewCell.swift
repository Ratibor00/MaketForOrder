//
//  ImageCollectionViewCell.swift
//  MaketForOrder
//
//  Created by Ratibor on 27.12.2023.
//

import UIKit
import SnapKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Private properties
    let imageViewCollection: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    // MARK: - Public methods
    func loadImage(from url: String) {
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: imageUrl) { [weak self] data, response, error in
            if let error = error {
                print("Image loading error: \(error.localizedDescription)")
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.imageViewCollection.image = image
                }
            }
        }
        task.resume()
    }
}

// MARK: - Private methods
private extension ImageCollectionViewCell {
    func setupUI() {
        setupImageViewCollection()
    }
    
    func setupImageViewCollection() {
        addSubview(imageViewCollection)
        imageViewCollection.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
