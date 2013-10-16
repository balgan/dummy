#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
        NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

        NSMutableArray *array = [[NSMutableArray alloc] init];

        NSString * input = @"/Users/Anne/Desktop/1.png";

        [array addObject:[NSData dataWithContentsOfFile:input]];
        [array addObject:[NSData dataWithContentsOfFile:input]];
        [array addObject:[NSData dataWithContentsOfFile:input]];

        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:array];
        NSString *path = @"/Users/Anne/Desktop/archive.dat";
        [data writeToFile:path options:NSDataWritingAtomic error:nil];


        // Unarchive

        NSMutableArray *archive = [NSKeyedUnarchiver unarchiveObjectWithFile:path];

        NSData * firstObject = [archive objectAtIndex:0];
        NSString * output = @"/Users/Anne/Desktop/2.png";
        NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:output];
        [firstObject writeToURL:fileURL atomically:YES];

        NSLog (@"hello world");
        [pool drain];
        return 0;
}
