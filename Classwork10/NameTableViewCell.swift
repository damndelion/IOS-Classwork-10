//
//  NameTableViewCell.swift
//  Lesson2_06
//
//  Created by Daniar on 02.11.2023.
//

import UIKit

final class NameTableViewCell: UITableViewCell {
    
    private lazy var wholeView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()
    private lazy var lineColors: UIColor = {
        var color = UIColor()
        return color
    }()
    private lazy var imageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var leftBorderColorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 8
        return view
        
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var timeTextView: UIView = {
        let view = UIView()
        view.addSubview(timeIcon)
        view.addSubview(timeLabel)
        return view
    }()
    private lazy var timeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "clock.fill")
        imageView.tintColor = .black
    
        return imageView
    }()
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var bottomTextView: UIView = {
        let view = UIView()
        view.addSubview(bottomLeftView)
        view.addSubview(bottomRightView)
        return view
    }()
    
    private lazy var bottomLeftView: UIView = {
        let view = UIView()
        view.addSubview(bottomLeftIcon)
        view.addSubview(bottomLeftLabel)
        return view
    }()
    
    private lazy var bottomRightView: UIView = {
        let view = UIView()
        view.addSubview(bottomRightIcon)
        view.addSubview(bottomRightLabel)
        return view
    }()
    
    private lazy var bottomLeftIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "exclamationmark.circle.fill")
        return imageView
    }()
    private lazy var bottomRightIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "bookmark.fill")
        imageView.tintColor = .brown
    
        return imageView
    }()
    
    private lazy var bottomLeftLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var bottomRightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Detail"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(name: String, time: String, timeLeft: String, color: String) {
        switch color {
        case ".red":
            lineColors = .red
        case ".blue":
            lineColors = .blue
        case ".green":
            lineColors = .green
        case ".yellow":
            lineColors = .yellow
        default:
            lineColors = .blue
        }
        
        bottomLeftIcon.tintColor = lineColors
        leftBorderColorView.backgroundColor = lineColors
        nameLabel.text = name
        timeLabel.text = time
        bottomLeftLabel.text = timeLeft
        nameLabel.text = name
    }
}

//MARK: - Setup UI

private extension NameTableViewCell {
    
    func setupUI() {
        setupViews()
        setupConstraints()
        
    }
    
    func setupViews() {
        
        addSubview(wholeView)
        wholeView.addSubview(leftBorderColorView)
        wholeView.addSubview(nameLabel)
        wholeView.addSubview(timeTextView)
        wholeView.addSubview(bottomTextView)
    }
    
    func setupConstraints() {
        wholeView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
        leftBorderColorView.snp.makeConstraints { make in
            make.height.equalTo(wholeView.snp.height)
            make.width.equalTo(wholeView.snp.width).dividedBy(20)
            make.left.equalTo(wholeView.snp.left)
        }
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(wholeView.snp.height).dividedBy(3)
            make.top.equalTo(wholeView.snp.top)
            make.left.equalTo(leftBorderColorView.snp.right).offset(15)
        }
        timeTextView.snp.makeConstraints { make in
            make.height.equalTo(wholeView.snp.height).dividedBy(3)
            make.top.equalTo(nameLabel.snp.bottom)
            make.left.equalTo(leftBorderColorView.snp.right)
        }
        timeIcon.snp.makeConstraints { make in
            make.left.equalTo(leftBorderColorView.snp.right).offset(15)
            make.centerY.equalTo(timeTextView.snp.centerY)
        }
        timeLabel.snp.makeConstraints { make in
            make.left.equalTo(timeIcon.snp.right).offset(15)
            make.centerY.equalTo(timeTextView.snp.centerY)
        }
        bottomTextView.snp.makeConstraints { make in
            make.height.equalTo(wholeView.snp.height).dividedBy(3)
            make.top.equalTo(timeLabel.snp.bottom)
            make.left.equalTo(leftBorderColorView.snp.right)
        }
        bottomLeftView.snp.makeConstraints { make in
            make.height.equalTo(bottomTextView.snp.height)
            make.width.equalTo(bottomTextView.snp.width).dividedBy(2)
            make.left.equalTo(leftBorderColorView.snp.right).offset(15)
        }
        bottomRightView.snp.makeConstraints { make in
            make.height.equalTo(bottomTextView.snp.height)
            make.width.equalTo(bottomTextView.snp.width).dividedBy(2)
            make.left.equalTo(bottomLeftLabel.snp.right).offset(50)
        }
        bottomLeftIcon.snp.makeConstraints { make in
            make.centerY.equalTo(bottomLeftView.snp.centerY)
            make.left.equalTo(bottomLeftView.snp.left)
            
        }
        bottomLeftLabel.snp.makeConstraints { make in
            make.centerY.equalTo(bottomLeftView.snp.centerY)
            make.left.equalTo(bottomLeftIcon.snp.right).offset(20)
        }
        
        bottomRightIcon.snp.makeConstraints { make in
            make.centerY.equalTo(bottomRightView.snp.centerY)
            make.left.equalTo(bottomRightView.snp.left)
        }
        bottomRightLabel.snp.makeConstraints { make in
            make.centerY.equalTo(bottomRightView.snp.centerY)
            make.left.equalTo(bottomRightIcon.snp.right).offset(20)
        }
        
    }
}
