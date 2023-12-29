//
//  ImageCollectionView.swift
//  MaketForOrder
//
//  Created by Ratibor on 27.12.2023.
//

import UIKit
import SnapKit

class ImageCollectionView: UICollectionView {
    
    // MARK: - init
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: Private properties
    private var currentPage: Int = 0
    
    var imageUrls: [String] = []
    var onPageChange: ((Int) -> Void)?
    
    //MARK: - Public methods
    func reloadImage() {
        DispatchQueue.main.async { [weak self] in
            self?.reloadData()
        }
    }
}

//MARK: - Private methods
private extension ImageCollectionView {
    func setupUI() {
        setupCollectionView()
        
    }
    
    func setupCollectionView() {
        delegate = self
        dataSource = self
        showsHorizontalScrollIndicator = false
        isPagingEnabled = true
        backgroundColor = .clear
        register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        setupFlowLayout()
        
    }
    
    private func setupFlowLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 5
            layout.minimumInteritemSpacing = 0
        }
    }
}

// MARK: - UICollectionViewDataSource
extension ImageCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        let imageUrl = imageUrls[indexPath.item]
        cell.loadImage(from: imageUrl)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ImageCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width - 5
        return CGSize(width: width, height: collectionView.bounds.size.height)
    }
}

// MARK: - UIScrollViewDelegate
extension ImageCollectionView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        guard page != currentPage else { return }
        currentPage = page
        onPageChange?(page)
    }
}

