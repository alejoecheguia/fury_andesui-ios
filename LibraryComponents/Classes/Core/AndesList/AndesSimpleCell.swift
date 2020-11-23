//
//  AndesSimpleViewCell.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 20/10/20.
//

import Foundation

/**
 This class is a custom cell to AndesUI, this cell has a basic configuration
*/
public class AndesSimpleCell: AndesListCell {

    /**
     This method initialize an AndesSimpleCell to draw the row just objc
     - Parameters:
       - title: Set the title for the cell
       - size: Set the size for the cell, the values are small, medium and large, the default is medium
       - subtitle: Set the subtitle for the cell
       - thumbnail: Set a thumbnail to the left of the cell
       - numberOfLines: Set the number of lines to the cell title, the default is 0
     - Authors: @Jona
     - Version : Available since 3.13.0
    */
    @available(swift, obsoleted: 1.0)
    @objc public init(withTitle title: String,
                      size: AndesListSize,
                      subtitle: String,
                      thumbnail: AndesThumbnail? = nil,
                      numberOfLines: Int) {
        super.init()
        self.cellConfig(withTitle: title,
                        size: size,
                        subtitle: subtitle,
                        thumbnail: thumbnail,
                        numberOfLines: numberOfLines)
    }

    /**
     This method initialize an AndesSimpleCell to draw the row
     - Parameters:
       - title: Set the title for the cell
       - size: Set the size for the cell, the values are small, medium and large, the default is medium, optional parameter
       - subtitle: Set the subtitle for the cell, optional parameter
       - thumbnail: Set a thumbnail to the left of the cell, optional parameter
       - numberOfLines: Set the number of lines to the cell title, the default is 0, optional parameter
     - Authors: @Jona
     - Version : Available since 3.13.0
    */
    public init(withTitle title: String,
                size: AndesListSize? = .medium,
                subtitle: String? = String(),
                thumbnail: AndesThumbnail? = nil,
                numberOfLines: Int = 0) {
        super.init()
        guard let size = size else { return }
        self.cellConfig(withTitle: title,
                        size: size,
                        subtitle: subtitle ?? "",
                        thumbnail: thumbnail,
                        numberOfLines: numberOfLines)
    }

    private func cellConfig(withTitle title: String,
                            size: AndesListSize,
                            subtitle: String,
                            thumbnail: AndesThumbnail? = nil,
                            numberOfLines: Int) {
        let config = AndesListCellFactory.provide(withSize: size,
                                                      subTitleIsEmpty: subtitle.isEmpty,
                                                      thumbnail: thumbnail)
        self.type = .simple
        self.title = title
        self.subtitle = subtitle
        self.fontStyle = config.font
        self.fontSubTitleStyle = config.fontDescription
        self.paddingLeftCell = config.paddingLeft
        self.paddingRightCell = config.paddingRight
        self.paddingTopCell = config.paddingTop
        self.paddingBottomCell = config.paddingBottom
        self.subTitleHeight = config.descriptionHeight
        self.separatorHeight = config.separatorHeight
        self.heightConstraint = config.height
        self.titleHeight = config.titleHeight
        self.thumbnailLeft = config.thumbnailLeft
        self.thumbnailSize = config.thumbnailSize
        self.separatorThumbnailWidth = config.separatorThumbnailWidth
        self.paddingTopThumbnail = config.paddingTopThumbnail
        self.paddingBottomThumbnail = config.paddingBottomThumbnail
        self.numberOfLines = numberOfLines
        self.thumbnailType = thumbnail?.type
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
