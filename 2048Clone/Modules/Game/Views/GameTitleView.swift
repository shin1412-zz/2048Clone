//
//  GameTitleView.swift
//  2048Clone
//
//  Created by Huong Nguyen on 10/06/2021.
//

import UIKit

typealias ColorScheme = [String: [String: String]]

class GameTitleView: UIView {
    var destroy = false
    var position = (x: -1, y: -1)
    var cornerRadius: CGFloat = 0 {
        didSet {
            lbValue.layer.cornerRadius = cornerRadius
        }
    }
    var value = -1 {
        didSet {
            if !isValueHidden {
                lbValue.text = "\(value)"
            }
            let str = value <= 2048 ? "\(value)" : "super"
            lbValue.backgroundColor = colorForType(str, key: "background")
            lbValue.textColor = colorForType(str, key: "text")
        }
    }
    var isValueHidden = false {
        didSet {
            if isValueHidden {
                lbValue.text = ""
            }
            
        }
    }
    var colorScheme: ColorScheme?
    var lbValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 70)
        label.minimumScaleFactor = 0.4
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.clipsToBounds = true
        label.baselineAdjustment = .alignCenters
        label.backgroundColor = UIColor(white: 0.5, alpha: 0.2)
        return label
    }()
    private var isSetup = false
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    fileprivate func setUp() {
        guard !isSetup else {return}
        isSetup = true
        alpha = 0
        
        self.addSubview(lbValue)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-p-[lbValue]-p-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: ["p": 5], views: ["lbValue": lbValue]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-p-[lbValue]-p-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: ["p": 5], views: ["lbValue": lbValue]))
    }

    fileprivate func colorForType(_ value: String, key: String) -> UIColor {
        if let colorScheme = colorScheme {
            if let vDic = colorScheme[value], let s = vDic[key] {
                return UIColor.colorWithHex(s)
            } else {
                if let vDic = colorScheme["default"], let s = vDic[key] {
                    return UIColor.colorWithHex(s)
                }
            }
        }
        return #colorLiteral(red: 0.5568627451, green: 0.5294117647, blue: 0.5019607843, alpha: 1)
    }
}
