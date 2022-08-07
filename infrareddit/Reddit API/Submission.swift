//
//  Submission.swift
//  infrareddit
//
//  Created by Benji Tusk on 7/25/22.
//

import Foundation
final class Submission: RedditThing {
    
    let author: Author
    let commentCount: Int
    let createdAt: Date
    let downVotes: Int
    let id: String
    let isArchived: Bool
    let isLocked: Bool
    let isMediaOnly: Bool
    let isNSFW: Bool
    let isOriginalContent: Bool
    let isPinned: Bool
    let isStickied: Bool
    let permalink: String
    let preview: RedditImageContainer?
    let selfText: String
    let subredditID: String
    let subredditName: String
    let submissionType: SubmissionType
    let thumbnailURL: URL?
    let title: String
    let totalAwardCount: Int
    let upVotes: Int
    let voteRatio: Double
    enum CodingKeys: String, CodingKey {
        
        // Mod Data
        case reportCount = "num_reports"
        case removedBy = "removed_by"
        case bannedAtUTC = "banned_at_utc"
        case approvedAtUTC = "approved_at_utc"
        case bannedBy = "banned_by"
        case removedByCategory = "removed_by_category"
        case modNote = "mod_note"
        case modRemovalTitle = "mod_reason_title"
        case userReports = "user_reports"
        case canModPost = "can_mod_post"
        case modReasonBy = "mod_reason_by"
        case removalReason = "removal_reason"
        case reportReasons = "report_reasons"
        case modReports = "mod_reports"
        
        // Author Data
        case authorName = "author"
        case authorIsBlocked = "author_is_blocked"
        case authorID = "author_fullname"
        
        // Subreddit Data
        case quarantine
        case subredditPrefixedName = "subreddit_name_prefixed"
        case subredditName = "subreddit"
        case subredditType = "subreddit_type"
        case subredditID = "subreddit_id"
        case subredditSubscribers = "subreddit_subscribers"


        // Flair config
        
        // Author flairs
        case authorFlairBackgroundColor = "author_flair_background_color"
        case authorFlairCSSClass = "author_flair_css_class"
        case authorFlairRichText = "author_flair_richtext"
        case authorFlairTemplateID = "author_flair_template_id"
        case authorFlairText = "author_flair_text"
        case authorFlairTextColor = "author_flair_text_color"
        case authorFlairType = "author_flair_type"
        case authorPatreonFlair = "author_patreon_flair"
        
        // Link flairs
        case linkFlairBackgroundColor = "link_flair_background_color"
        case linkFlairCSSClass = "link_flair_css_class"
        case linkFlairRichText = "link_flair_richtext"
        case linkFlairTemplateID = "link_flair_template_id"
        case linkFlairText = "link_flair_text"
        case linkFlairTextColor = "link_flair_text_color"
        case linkFlairType = "link_flair_type"
        
        // Other fields
        case allAwards = "all_awardings"
        case allowLiveComments = "allow_live_comments"
        case approvedBy = "approved_by"
        case archived
        case authorHasPremium = "author_premium"
        case awardCount = "total_awards_received"
        case awarders
        case canGild = "can_gild"
        case category
        case clicked
        case commentCount = "num_comments"
        case contentCategories = "content_categories"
        case contestMode = "contest_mode"
        case created
        case createdAtUTC = "created_utc"
        case crosspostCount = "num_crosspost"
        case discussionType = "discussionType"
        case distinguished
        case domain
        case downvoteCount = "downs"
        case edited
        case fullName = "name"
        case gilded
        case gildings
        case hidden
        case id
        case isCreatedFromAdsUI = "is_created_from_ads_ui"
        case isCrosspostable = "is_crosspostable"
        case isMeta = "is_meta"
        case isNSFW = "over_18"
        case isOriginalContent = "is_original_content"
        case isRedditMediaDomain = "is_reddit_media_domain"
        case isRobotIndexable = "is_robot_indexable"
        case isSelf = "is_self"
        case isVideo = "is_video"
        case likes
        case locked
        case media
        case mediaEmbed = "media_embed"
        case mediaOnly = "media_only"
        case noFollow = "no_follow"
        case parentWhitelistStatus = "parent_whitelist_status"
        case permalink
        case pinned
        case preview
        case saved = "saved"
        case score
        case scoreHidden = "hide_score"
        case secureMedia = "secure_media"
        case secureMediaEmbed = "secure_media_embed"
        case selfText = "selftext"
        case selfTextHTML = "selftext_html"
        case sendReplies = "send_replies"
        case spoiler
        case stickied
        case suggestedSort = "suggested_sort"
        case thumbnail
        case thumbnailHeight = "thumbnail_height"
        case thumbnailWidth = "thumbnail_width"
        case title
        case topAwardedType = "top_awarded_type"
        case treatmentTags = "treatment_tags"
        case upvoteCount = "ups"
        case url
        case viewCount = "view_count"
        case visited
        case voteRatio = "upvote_ratio"
        case whitelistStatus = "whitelist_status"
    }
    
    enum RootKeys: CodingKey {
        case kind, data
    }
    
    enum SubmissionType: String, Decodable {
        /// A post that only contains text
        case text
        /// A post containing media or a link
        case link
    }
    
    init(title: String, selfText: String, author: Author, upVotes: Int, downVotes: Int, totalAwardCount: Int, isOriginalContent: Bool, thumbnailURL: URL?, createdAt: Date, isArchived: Bool, isNSFW: Bool, isPinned: Bool, isMediaOnly: Bool, isLocked: Bool, id: String, subredditID: String, commentCount: Int, permalink: String, isStickied: Bool, voteRatio: Double, subredditName: String, submissionType: SubmissionType) {
        self.title = title
        self.selfText = selfText
        self.author = author
        self.upVotes = upVotes
        self.downVotes = downVotes
        self.totalAwardCount = totalAwardCount
        self.isOriginalContent = isOriginalContent
        self.thumbnailURL = thumbnailURL
        self.createdAt = createdAt
        self.isArchived = isArchived
        self.isNSFW = isNSFW
        self.isPinned = isPinned
        self.isMediaOnly = isMediaOnly
        self.isLocked = isLocked
        self.id = id
        self.subredditID = subredditID
        self.commentCount = commentCount
        self.permalink = permalink
        self.isStickied = isStickied
        self.voteRatio = voteRatio
        self.subredditName = subredditName
        self.preview = nil
        self.submissionType = submissionType
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self).nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        
        // Author data
        if let authorID = try container.decodeIfPresent(String.self, forKey: .authorID) {
            let authorUsername = try container.decode(String.self, forKey: .authorName)
            let authorIsBlocked = try container.decode(Bool.self, forKey: .authorIsBlocked)
            let authorHasPatreonFlair = try container.decode(Bool.self, forKey: .authorPatreonFlair)
            let authorHasPremium = try container.decode(Bool.self, forKey: .authorHasPremium)
            author = Author(username: authorUsername,
                            id: authorID,
                            isBlocked: authorIsBlocked,
                            patreonFlair: authorHasPatreonFlair,
                            hasPremium: authorHasPremium)
        } else {
            author = Author.deletedUser
        }
        if let thumbnail = try container.decode(String?.self, forKey: .thumbnail),
           thumbnail.hasPrefix("http") {
            thumbnailURL = URL(string: thumbnail)!
        } else {
            thumbnailURL = nil
        }
        let createdAtTimestamp = try container.decode(Int.self, forKey: .createdAtUTC)
        if try container.decode(Bool.self, forKey: .isSelf) {
            submissionType = .text
        } else {
            submissionType = .link
        }
        
        
        commentCount = try container.decode(Int.self, forKey: .commentCount)
        createdAt = Date(timeIntervalSince1970: TimeInterval(createdAtTimestamp))
        downVotes = try container.decode(Int.self, forKey: .downvoteCount)
        id = try container.decode(String.self, forKey: .fullName)
        isArchived = try container.decode(Bool.self, forKey: .archived)
        isLocked = try container.decode(Bool.self, forKey: .locked)
        isMediaOnly = try container.decode(Bool.self, forKey: .mediaOnly)
        isNSFW = try container.decode(Bool.self, forKey: .isNSFW)
        isOriginalContent = try container.decode(Bool.self, forKey: .isOriginalContent)
        isPinned = try container.decode(Bool.self, forKey: .pinned)
        isStickied = try container.decode(Bool.self, forKey: .stickied)
        permalink  = try container.decode(String.self, forKey: .permalink)
        preview = try? container.decode(RedditImageContainer.self, forKey: .preview)
        selfText = try container.decode(String.self, forKey: .selfText)
        subredditID = try container.decode(String.self, forKey: .subredditID)
        subredditName = try container.decode(String.self, forKey: .subredditName)
        title = try container.decode(String.self, forKey: .title)
        totalAwardCount = try container.decode(Int.self, forKey: .awardCount)
        upVotes = try container.decode(Int.self, forKey: .upvoteCount)
        voteRatio = try container.decode(Double.self, forKey: .voteRatio)
    }
    
    static var sample = Submission(title: "Test submission!",
                                   selfText: "This is a test submission used for aiding in the development of InfraReddit, a Reddit client for iOS. I really hope development goes smoothly! I'll keep you updated as I go. Wish me luck!!",
                                   author: .sample,
                                   upVotes: 84_928,
                                   downVotes: 290,
                                   totalAwardCount: 19,
                                   isOriginalContent: true,
                                   thumbnailURL: nil,
                                   createdAt: Date.now,
                                   isArchived: false,
                                   isNSFW: false,
                                   isPinned: false,
                                   isMediaOnly: false,
                                   isLocked: false,
                                   id: "INVALID_ID",
                                   subredditID: "INVALID_ID",
                                   commentCount: 7_389,
                                   permalink: "link to nowhere",
                                   isStickied: false,
                                   voteRatio: 0.98,
                                   subredditName: "AppDev",
                                   submissionType: .text
    )
}

struct RedditImageContainer: Decodable {
    struct Image: Decodable {
        struct ImageSource: Decodable {
            let url: String
            let width: Int
            let height: Int
        }
        let source: ImageSource
        let resolutions: [ImageSource]
    }
    let images: [RedditImageContainer.Image]
    let enabled: Bool
}

