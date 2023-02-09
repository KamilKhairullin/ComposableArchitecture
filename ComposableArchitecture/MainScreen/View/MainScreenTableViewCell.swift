import Foundation
import UIKit

final class MainScreenTableViewCell: UITableViewCell {
    // MARK: - Properties

    static let reuseIdentifier = "ViewControllerTableViewCell"

    private lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private

    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(title)
        title.frame = .init(
            x: 0 + Insets.labelInsets.left,
            y: 0 + Insets.labelInsets.top,
            width: textWidth(text: title.text, font: title.font),
            height: 64
        )
    }
    
    private func textWidth(text: String?, font: UIFont) -> CGFloat {
        guard let text = text else { return 0 }
        let constraintRect = UIScreen.main.bounds.size
        let boundingBox = text.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.width)
    }
}

// MARK: - Nested types

extension MainScreenTableViewCell {
    enum Insets {
        static let labelInsets: UIEdgeInsets = .init(top: 0, left: 30, bottom: 0, right: 0)
    }
}

// MARK: - TaskListModuleTaskCellConfigurable extension

extension MainScreenTableViewCell: CellConfigurable {
    func configure(with data: CellData) {
        switch data {
        case .text(let text):
            title.text = text
        }
    }
}
