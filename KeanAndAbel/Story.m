//
//  Story.m
//  KeanAndAbel
//
//  Created by KeizuDevMacMini on 4/27/16.
//  Copyright (c) 2016 Thuong Nguyen Quoc. All rights reserved.
//

#import "Story.h"

@implementation Story
#pragma mark - Public

+ (void)loadStories:(void (^)(NSArray *stories, NSError *error))completion {
    NSParameterAssert(completion);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error = nil;
        NSString *path = [[NSBundle mainBundle] bundlePath];
        NSFileManager *manager = [NSFileManager defaultManager];
        NSArray *contents = [manager contentsOfDirectoryAtPath:path error:&error];
        NSMutableArray *stories = [NSMutableArray array];
        if (contents) {
            error = nil;
            for (NSString *file in contents) {
                if ([file hasSuffix:@".grm"]) {
                    NSString *filePath = [path stringByAppendingPathComponent:file];
                    Story *story = [Story new];
                    story.title = [file stringByDeletingPathExtension];
                    story.content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
      
                    if (error) {
                        break;
                    }
                    [stories addObject:story];
                    error = nil;
                }
            }
        }
        NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
        [stories sortUsingDescriptors:@[descriptor]];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                completion(nil, error);
            } else {
                completion(stories, nil);
            }
        });
    });
}
@end
