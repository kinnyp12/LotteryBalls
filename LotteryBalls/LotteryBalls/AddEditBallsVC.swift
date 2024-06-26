//
//  AddEditBallsVC.swift
//  LotteryBalls
//
//  Created by Kinny Padia on 25/06/24.
//

import UIKit

class AddEditBallsVC: UIViewController {

    
    @IBOutlet weak var colSelectedBall: UICollectionView!
    @IBOutlet weak var colNormalBall: UICollectionView!
    
    var buttons = ArraysData.lotteryBalls[MyStrings.selectedLottery]

    var selectedBalls = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickDone(_ sender: UIButton) {
        if selectedBalls != 0{
            ArraysData.selectedBalls[MyStrings.selectedLottery]?.append(selectedBalls)
        }
        navigationController?.popViewController(animated: true)
    }
}

extension AddEditBallsVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == colSelectedBall{
            return selectedBalls
        } else{
            return ArraysData.lotteryBalls[MyStrings.selectedLottery] ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "normalBallsCell", for: indexPath) as! NormalBallsCell
        cell.btnNormalBall.setImage(UIImage(named: "ball"), for: .normal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == colSelectedBall{
            selectedBalls -= 1
            ArraysData.lotteryBalls[MyStrings.selectedLottery]! += 1
        } else{
            if selectedBalls < 5{
                selectedBalls += 1
                ArraysData.lotteryBalls[MyStrings.selectedLottery]! -= 1
            }
        }
        colSelectedBall.reloadData()
        colNormalBall.reloadData()
    }
}

class NormalBallsCell: UICollectionViewCell{
    
    @IBOutlet weak var btnNormalBall: UIButton!
    
}
