//
//  MyLotteryVC.swift
//  LotteryBalls
//
//  Created by Kinny Padia on 25/06/24.
//

import UIKit

class MyLotteryVC: UIViewController {

    var keys: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        keys = Array(ArraysData.selectedBalls.keys).filter { ArraysData.selectedBalls[$0] != 0 }

    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}

extension MyLotteryVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let key = keys[section]
        return ArraysData.selectedBalls[key] ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "normalBallsCell", for: indexPath) as! NormalBallsCell
        cell.btnNormalBall.setImage(UIImage(named: "ball"), for: .normal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView

            headerView.lblTitle.text = keys[indexPath.section]

            return headerView
        }

        return UICollectionReusableView()
    }

}

class HeaderView: UICollectionReusableView{
    
    @IBOutlet weak var lblTitle: UILabel!

}
