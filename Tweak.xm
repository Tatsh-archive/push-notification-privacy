@interface SpringBoard : UIApplication <UIApplicationDelegate>
- (_Bool)isLocked;
@end

/*%hook BBSectionInfo
- (_Bool)showsMessagePreview {
    _Bool r = %orig;

    if ([(SpringBoard *)[UIApplication sharedApplication] isLocked]) {
        NSLog(@"isLocked = true?");
        return NO;
    }

    NSLog(@"Returning original value: %d", r);

    return r;
}
%end*/
%hook BBBulletin
- (_Bool)showsMessagePreview {
    // _Bool r = %orig;

    if ([(SpringBoard *)[UIApplication sharedApplication] isLocked]) {
        NSLog(@"isLocked = true?");
        return NO;
    }

    return YES;
}
%end
