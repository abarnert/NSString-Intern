# NSString-Intern
A simple category to add an `-intern` method to `NSString` objects

Let's say you have code that reads/generates/whatever some strings:

    NSMutableArray<NSString *> *strings = [[NSMutableArray alloc] init];
    for (int i=0; i!=1000000; ++i) {
        NSString *s = makeStringHowever();
        [strings addObject:s];
    }

Storing a million strings of 100 bytes each takes 100MB. But what
if many of those strings occur repeatedly, so much so that the mean
string occurs 1000 times? Then you only need to store the 1000
unique strings, which only takes 100KB. (OK, fine, you still need
an array of a million pointers to those strings, which is still
8MB, but 8MB is a lot better than 108MB.)

And, because ObjC already makes you deal with strings as pointers
to some opaque immutable thing that you can only access by sending
messages, swapping out one string object for another one that
responds to the same messages the same way is safe and easy. Just
drop these two files somewhere in your project, then change one 
line of code to call `intern`, and you're done:

    #import "NSString+Intern.h"
    
    // ...
    
    NSMutableArray<NSString *> *strings = [[NSMutableArray alloc] init];
    for (int i=0; i!=1000000; ++i) {
        NSString *s = makeStringHowever();
        [strings addObject:[s intern]];
    }
    
If speed is an issue—especially if you don't need thread safety in
the first place—you will probably want to edit the code to do
something other than `@synchronized`.
