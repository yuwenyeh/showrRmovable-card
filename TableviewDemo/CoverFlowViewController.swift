//
//  CoverFlowViewController.swift
//  TableviewDemo
//
//  Created by 葉育彣 on 2022/12/15.
//

import UIKit

class CoverFlowViewController: UIViewController {

    @IBOutlet weak var mCoverCollectionView: UICollectionView!
    private var collectionLayout: CoverFlowLayout = CoverFlowLayout()
    private var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setlayoutView()
        mCoverCollectionView.delegate = self
        mCoverCollectionView.dataSource = self
        mCoverCollectionView.registerCell(CoverFlowCollectionViewCell.self)
        mCoverCollectionView.collectionViewLayout = collectionLayout
    }
    
    
    private func setlayoutView(){
        let margin: CGFloat = 20
        let collH: CGFloat = 200
        let itemH = collH - margin * 2
        let itemW = view.bounds.width - margin * 2 - 100
        collectionLayout.itemSize = CGSize(width: itemW, height: itemH)
        collectionLayout.minimumLineSpacing = 5
        collectionLayout.minimumInteritemSpacing = 5
        collectionLayout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        collectionLayout.scrollDirection = .horizontal
    }
}

extension CoverFlowViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CoverFlowCollectionViewCell = collectionView.dequeueResuableCell(for: indexPath)
        cell.text = "\(number)"
        number += 1
        cell.backgroundColor = indexPath.item % 2 == 0 ? .purple : .red
        return cell
    }
    
    
}
