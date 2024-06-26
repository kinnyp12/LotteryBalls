//
//  CustomAttributes.swift
//  LotteryBalls
//
//  Created by Kinny Padia on 25/06/24.
//

import UIKit

@IBDesignable
class PaddedTextField: UITextField {

    // MARK: - Properties

    @IBInspectable var leftPadding: CGFloat = 0
    @IBInspectable var rightPadding: CGFloat = 0
    @IBInspectable var topPadding: CGFloat = 0
    @IBInspectable var bottomPadding: CGFloat = 0

    // MARK: - Text Rect Overrides

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding))
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding))
    }
}

struct ArraysData{
    static var lotteries = [MyStrings.powerBall, MyStrings.megaMillions, MyStrings.lotto, MyStrings.northStarCash, MyStrings.gopher5, MyStrings.daily3]
 
    static var lotteryBalls: [String: Int] = [MyStrings.powerBall : 69, MyStrings.megaMillions : 70, MyStrings.lotto : 52, MyStrings.northStarCash : 31, MyStrings.gopher5 : 47, MyStrings.daily3 : 9]

    static var selectedBalls: [String: [Int]] = [MyStrings.powerBall : [], MyStrings.megaMillions : [], MyStrings.lotto : [], MyStrings.northStarCash : [], MyStrings.gopher5 : [], MyStrings.daily3 : []]

}

struct MyStrings{
    
    static var powerBall = "Power Ball"
    static var megaMillions = "Mega Millions"
    static var lotto = "Lotto"
    static var northStarCash = "NorthStar Cash"
    static var gopher5 = "Gopher 5"
    static var daily3 = "Daily 3"
    
    static var selectedLottery = ""
}
