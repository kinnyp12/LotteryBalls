//
//  AddEditBallsVC.swift
//  LotteryBalls
//
//  Created by Kinny Padia on 25/06/24.
//

import UIKit

class AddEditBallsVC: UIViewController {

    
    @IBOutlet weak var selectedStack: UIStackView!
    @IBOutlet weak var normalStackVer: UIStackView!
    
    var buttons = ArraysData.lotteryBalls[MyStrings.selectedLottery]

    let columns = 7  // Number of columns in each row

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var rowIndex = 0
                
        // Loop through the buttons array in chunks of 'columns'
        for _ in stride(from: 0, to: buttons ?? 0, by: columns) {
            let horizontalStack = UIStackView()
            horizontalStack.axis = .horizontal
            horizontalStack.spacing = 10
            horizontalStack.alignment = .center
            horizontalStack.distribution = .fillEqually
            normalStackVer.addArrangedSubview(horizontalStack)
            
            // Loop to create buttons in each row
            for columnIndex in 0..<columns {
                let buttonIndex = rowIndex * columns + columnIndex
                if buttonIndex < buttons ?? 0 {
                    let button = UIButton(type: .system)
                    button.setImage(UIImage(named: "ball"), for: .normal)
                    button.widthAnchor.constraint(equalToConstant: 40).isActive = true
                    button.heightAnchor.constraint(equalToConstant: 40).isActive = true
                    button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                    horizontalStack.addArrangedSubview(button)
                } else {
                    horizontalStack.addArrangedSubview(UIView()) // Placeholder view if button index exceeds count
                }
            }
            
            rowIndex += 1
        }
    }

    @objc func buttonTapped(_ sender: UIButton) {
        if let title = sender.titleLabel {
            
        }
    }
    
    @IBAction func onClickDone(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
