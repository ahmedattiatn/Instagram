//
//  MockedFeed.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

extension Feed {
    static func fake(id: Int = 1) -> Feed {
        Feed(
            id: id,
            user: User(
                id: id,
                name: "User \(id)",
                avatarURL: "https://i.pravatar.cc/150?img=1"
            ),
            caption: "Caption \(id)",
            photos: Photos(
                backCameraURL: "https://picsum.photos/seed/back1/600/800",
                frontCameraURL: "https://picsum.photos/seed/front1/300/400"
            ),
            createdAt: "2025-03-01T08:10:00Z",
            postedLate: false,
            reactions: []
        )
    }
}

public extension FeedResponse {
    static func fake() -> Self {
        FeedResponse(
            feeds: [
                .fake(id: 1),
                .fake(id: 2),
                .fake(id: 3)
            ]
        )
    }
}
