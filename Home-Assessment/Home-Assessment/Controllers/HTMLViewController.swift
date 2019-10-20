//
//  HTMLViewController.swift
//  Home-Assessment
//
//  Created by Coco Xtet Pai on 20/10/2019.
//  Copyright © 2019 Ko Ko Htet Paing. All rights reserved.
//

import UIKit

class HTMLViewController: UIViewController {
    
    var items = [HTMLItem]()
    
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var btnAdd: UIBarButtonItem!
    @IBOutlet weak var btnDelete: UIBarButtonItem!
    @IBOutlet weak var btnleft: UIBarButtonItem!
    @IBOutlet weak var btnRight: UIBarButtonItem!
    
    var selectedIndex = IndexPath(item: 0, section: 0)

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        
        items = HTMLItem.getDummy()
        
        collectionView.isPagingEnabled = true
        collectionView.isDirectionalLockEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false

        let nib = UINib(nibName: HTMLViewCell.className, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: HTMLViewCell.className)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        btnleft.isEnabled = false
        self.view.backgroundColor = .blue
    }
    
    @IBAction func toolBarActions(sender: UIBarButtonItem) {
        
        switch sender {
        case btnleft:
            
            let indexPath = IndexPath(item: selectedIndex.item - 1, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
            
            btnleft.isEnabled = indexPath.item > 0
            btnRight.isEnabled = indexPath.item < items.count - 1
            selectedIndex = indexPath
            
        case btnRight:
            
            let indexPath = IndexPath(item: selectedIndex.item + 1, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
            btnleft.isEnabled = indexPath.item > 0
            btnRight.isEnabled = indexPath.item < items.count - 1
            selectedIndex = indexPath

        default:
            break
        }
    }
}

extension HTMLViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HTMLViewCell.className, for: indexPath)
        cell.backgroundColor = items[indexPath.item].backgroundColor
        return cell
    }
    
}

extension HTMLViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

extension HTMLViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let item = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        selectedIndex = IndexPath(item: item, section: 0)
        btnleft.isEnabled = selectedIndex.item > 0
        btnRight.isEnabled = selectedIndex.item < items.count - 1
    }
}
