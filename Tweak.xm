@interface SpringBoard : UIApplication <UIApplicationDelegate>
- (_Bool)isLocked;
@end

%hook BBBulletin
- (_Bool)showsMessagePreview {
    if ([(SpringBoard *)[UIApplication sharedApplication] isLocked]) {
        return NO;
    }

    return YES;
}
%end
