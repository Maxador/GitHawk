//
//  NoNewNotificationsCell.swift
//  Freetime
//
//  Created by Ryan Nystrom on 6/30/17.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import UIKit
import SnapKit

final class NoNewNotificationsCell: UICollectionViewCell {

    let emoji = UILabel()
    let label = UILabel()
    let shadow = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)

        emoji.text = "🎉"
        emoji.textAlignment = .center
        emoji.backgroundColor = .clear
        emoji.font = UIFont.systemFont(ofSize: 60)
        contentView.addSubview(emoji)
        emoji.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.centerY.equalTo(contentView).offset(-Styles.Sizes.tableSectionSpacing)
        }

        let emojiBounce = CABasicAnimation(keyPath: "transform.translation.y")
        emojiBounce.toValue = -10
        emojiBounce.repeatCount = Float.greatestFiniteMagnitude
        emojiBounce.autoreverses = true
        emojiBounce.duration = 1
        emoji.layer.add(emojiBounce, forKey: nil)

        contentView.layer.addSublayer(shadow)

        let shadowScale = CABasicAnimation(keyPath: "transform.scale")
        shadowScale.toValue = 0.9
        shadowScale.repeatCount = Float.greatestFiniteMagnitude
        shadowScale.autoreverses = true
        shadowScale.duration = 1
        shadow.add(shadowScale, forKey: nil)

        label.text = NSLocalizedString("No new notifications", comment: "")
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.font = Styles.Fonts.body
        label.textColor = Styles.Colors.Gray.light.color
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalTo(emoji)
            make.top.equalTo(emoji.snp.bottom).offset(Styles.Sizes.tableSectionSpacing)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let width: CGFloat = 30
        let height: CGFloat = 13
        let rect = CGRect(x: contentView.center.x - width/2 - 10, y: contentView.center.y + 5, width: width, height: height)
        shadow.path = UIBezierPath(ovalIn: CGRect(origin: .zero, size: CGSize(width: width, height: height))).cgPath
//        shadow.bounds = rect
        shadow.position = CGPoint(x: contentView.bounds.width/2 - 25, y: contentView.bounds.height/2 + 5)
    }

}