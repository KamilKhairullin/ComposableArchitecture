import Foundation
import UIKit

protocol HomeScreenConfigurableCell: Configurable where Model == HomeScreenCellData {}


final class HomeScreenTableViewCell: UITableViewCell {
    
    // MARK: - Properties

    static let reuseIdentifier = "HomeScreenTableViewCell"

    private lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = ColorPalette.text
        label.font = Fonts.normal
        return label
    }()

    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutTitle()
    }
    
    // MARK: - Private
    
    private func setupViews() {
        addSubview(title)
    }
    
    private func layoutTitle() {
        
        let width = contentView.frame.width
            - Insets.labelInsets.right
            - Insets.labelInsets.left
        
        title.frame = .init(
            origin: CGPoint(
                x: Insets.labelInsets.left,
                y: contentView.center.y + Insets.labelInsets.top - (Constants.titleHeight / 2)
            ),
            size: CGSize(
                width: width,
                height: Constants.titleHeight
            )
        )
    }
}

// MARK: - Nested types

extension HomeScreenTableViewCell {
    enum Insets {
        static let labelInsets: UIEdgeInsets = .init(top: 0, left: 30, bottom: 0, right: 0)
    }
    
    enum Constants {
        static let titleHeight: CGFloat = 20
    }
}

// MARK: - HomeScreenConfigurableCell extension

extension HomeScreenTableViewCell: HomeScreenConfigurableCell {
    func configure(with data: HomeScreenCellData) {
        switch data {
        case .text(let text):
            title.text = text
        }
    }
}
