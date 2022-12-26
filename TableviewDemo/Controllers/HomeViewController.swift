//
//  HomeViewController.swift
//  TableviewDemo
//
//  Created by 葉育彣 on 2022/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak private var mCollectionView: UICollectionView!
    var itemCount: Int = 30
    var layout: HomeFlowLayout = HomeFlowLayout()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "瀑布流"
        setUpView()
    }
    
    private func setUpView() {
        layout.delegate = self
        mCollectionView.collectionViewLayout = layout
        mCollectionView.dataSource = self
        
        //註冊cell
        mCollectionView.registerXibCell(HomeCollectionViewCell.self)
        view.addSubview(mCollectionView)
    }
    
}
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:HomeCollectionViewCell = collectionView.dequeueResuableCell(for: indexPath)
        cell.cellIndex = indexPath.row
        cell.setUI(indexPath.item % 2 == 0 ? 1 : 2)
        cell.backgroundColor = indexPath.item % 2 == 0 ? .systemBlue : .purple
        return cell
    }
}

extension HomeViewController: HomeFallLayoutDelegate {
    func homeFlowLayout(_ homeFlowLayout: HomeFlowLayout, itemHeight indexPath: IndexPath) -> CGFloat {
        return CGFloat(arc4random_uniform(150) + 50)
    }
}
