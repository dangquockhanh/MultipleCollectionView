//
//  ViewController.swift
//  MultipleCollectionView
//
//  Created by Đặng Khánh  on 7/15/19.
//  Copyright © 2019 Đặng Khánh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var meal: UICollectionView!
    @IBOutlet weak var girlCollectionView: UICollectionView!
    
    
    var girls: [UIImage] = [#imageLiteral(resourceName: "Hang"),#imageLiteral(resourceName: "Trang"),#imageLiteral(resourceName: "Quynh"), #imageLiteral(resourceName: "Mai"), #imageLiteral(resourceName: "Linh")]
    var meals: [UIImage] = [#imageLiteral(resourceName: "cho"), #imageLiteral(resourceName: "doiCho"), #imageLiteral(resourceName: "thitChoHap"), #imageLiteral(resourceName: "ruouMan"), #imageLiteral(resourceName: "thitChoNuong")]
    
    let minimumLineSpacing: CGFloat = 2
    let minimumiterItemSpacing: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.girlCollectionView {
            return girls.count
        } else {
            return meals.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.girlCollectionView {
            let cell: GirlCollectionViewCell = girlCollectionView.dequeueReusableCell(withReuseIdentifier: "GirlCollectionViewCell", for: indexPath) as! GirlCollectionViewCell
            cell.girlImageView.image = girls[indexPath.row]
            return cell
        } else {
            let cell: MealCollectionViewCell = meal.dequeueReusableCell(withReuseIdentifier: "MealGirlCollectionViewCell", for: indexPath) as! MealCollectionViewCell
            cell.mealImageView.image = meals[indexPath.row]
            return cell
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberItem: CGFloat = 5
        let width = (UIScreen.main.bounds.width - minimumLineSpacing) / numberItem
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumiterItemSpacing
    }
}
