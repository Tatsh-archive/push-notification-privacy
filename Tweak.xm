@interface SpringBoard : UIApplication <UIApplicationDelegate>
- (_Bool)isLocked;
@end

%hook BBBulletin
- (_Bool)showsMessagePreview {
    if ([(SpringBoard *)[UIApplication sharedApplication] isLocked]) {
        NSLog(@"isLocked = true?");
        return NO;
    }

    return YES;
}
%end
