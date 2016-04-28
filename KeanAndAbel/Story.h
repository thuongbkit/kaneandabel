//
//  Story.h
//  KeanAndAbel
//
//  Created by KeizuDevMacMini on 4/27/16.
//  Copyright (c) 2016 Thuong Nguyen Quoc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Story : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *content;

+ (void)loadStories:(void (^)(NSArray *stories, NSError *error))completion;

@end
