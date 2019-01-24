/************************************************************
 *  * Hyphenate CONFIDENTIAL
 * __________________
 * Copyright (C) 2016 Hyphenate Inc. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of Hyphenate Inc.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Hyphenate Inc.
 */

#import "EaseConversationModel.h"
#import "UIImage+EaseBundle.h"

#if ENABLE_LITE == 1
#import <HyphenateLite/EMConversation.h>
#else
#import <Hyphenate/EMConversation.h>
#endif

@implementation EaseConversationModel

- (instancetype)initWithConversation:(EMConversation *)conversation
{
    self = [super init];
    if (self) {
        _conversation = conversation;
        _title = _conversation.conversationId;
        if (conversation.type == EMConversationTypeChat) {
            _avatarImage = [UIImage ease_imageNamedFromMyBundle:@"user"];
        }
        else{
            _avatarImage = [UIImage ease_imageNamedFromMyBundle:@"group"];
        }
    }
    
    return self;
}

@end
