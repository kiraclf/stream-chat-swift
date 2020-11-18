//
// Copyright © 2020 Stream.io Inc. All rights reserved.
//

import StreamChat
import UIKit

public struct UIConfig<ExtraData: UIExtraDataTypes> {
    public var channelList: ChannelListUI
    public var currentUser: CurrentUserUI
    public var navigation: Navigation
    
    public init(
        channelList: ChannelListUI = .init(),
        currentUser: CurrentUserUI = .init(),
        navigation: Navigation = .init()
    ) {
        self.channelList = channelList
        self.currentUser = currentUser
        self.navigation = navigation
    }
}

// MARK: - UIConfig + Default

private var defaults: [String: Any] = [:]

public extension UIConfig {
    static var `default`: Self {
        get {
            let key = String(describing: ExtraData.self)
            if let existing = defaults[key] as? Self {
                return existing
            } else {
                let config = Self()
                defaults[key] = config
                return config
            }
        }
        set {
            let key = String(describing: ExtraData.self)
            defaults[key] = newValue
        }
    }
}

// MARK: - Navigation

public extension UIConfig {
    struct Navigation {
        public var navigationBar: ChatNavigationBar.Type
        
        public init(
            navigationBar: ChatNavigationBar.Type = ChatNavigationBar.self
        ) {
            self.navigationBar = navigationBar
        }
    }
}

// MARK: - ChannelListUI

public extension UIConfig {
    struct ChannelListUI {
        public var channelCollectionView: ChatChannelListCollectionView.Type
        public var channelCollectionLayout: UICollectionViewLayout.Type
        public var channelView: ChatChannelView<ExtraData>.Type
        public var channelViewCell: ChatChannelListCollectionViewCell<ExtraData>.Type
        public var avatarView: AvatarView.Type
        public var newChannelButton: CreateNewChannelButton.Type
        
        public init(
            channelCollectionView: ChatChannelListCollectionView.Type = ChatChannelListCollectionView.self,
            channelCollectionLayout: UICollectionViewLayout.Type = ChatChannelListCollectionViewLayout.self,
            channelView: ChatChannelView<ExtraData>.Type = ChatChannelView<ExtraData>.self,
            channelViewCell: ChatChannelListCollectionViewCell<ExtraData>.Type = ChatChannelListCollectionViewCell<ExtraData>.self,
            avatarView: AvatarView.Type = AvatarView.self,
            newChannelButton: CreateNewChannelButton.Type = CreateNewChannelButton.self
        ) {
            self.channelCollectionView = channelCollectionView
            self.channelCollectionLayout = channelCollectionLayout
            self.channelView = channelView
            self.channelViewCell = channelViewCell
            self.avatarView = avatarView
            self.newChannelButton = newChannelButton
        }
    }
}

// MARK: - CurrentUser

public extension UIConfig {
    struct CurrentUserUI {
        public var currentUserView: CurrentChatUserAvatarView<ExtraData>.Type
        public var currentUserAvatarView: AvatarView.Type

        public init(
            currentUserView: CurrentChatUserAvatarView<ExtraData>.Type = CurrentChatUserAvatarView<ExtraData>.self,
            currentUserAvatarView: AvatarView.Type = AvatarView.self
        ) {
            self.currentUserView = currentUserView
            self.currentUserAvatarView = currentUserAvatarView
        }
    }
}