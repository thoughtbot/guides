#import "Alpha.h"
#import "Beta.h"

// Use enums when possible. They should be named similarly, with the prefix
// coming from the defined enum type
typedef NS_ENUM(NSInteger, MyEnum) {
  MyEnumNumberOne,
  MyEnumNumberTwo
};

// Use @interface extensions for private properties
@interface TBClassName () <Protocols>

// Keep @properties grouped together by function
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (strong, nonatomic, readonly) TBObject *someObject;

@end

// Use static NSString points to consts for string constants
static NSString *const ConstantName = @"Constant";

// Prepend constants with 'k' when being used as keys
static NSString *const kFirstName = @"FirstName";

// Always use an appropriate 2 or 3 letter prefix for class names
@implementation TBClassName

/*
 - Use #pragma mark to organize code by function
 - Use descriptive names for #pragma mark
 - Use class names if overriding or implementing protocol methods
*/
#pragma mark - Initialization

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    // Return early if conditions prohibit the intended function of the method
    // Use conditionals for exceptional cases
    // Keep the 'optimal' path non-indented
    if (!self) return nil;

    // initialization code

    return self;
}

#pragma mark - UI

// Opening brackets for method definitions belong on the next line
- (void)shuffleCards
{
    // Objective-C literals are your friend
    NSDictionary *themeColors = @{ kRedColor : [UIColor redColor], kBlueColor : [UIColor blueColor] };
    NSArray *robots = @[ @"Ralph", @"Bender", @"The Iron Giant" ];
    NSNumber *magicNumber = @3;

    NSMutableArray *deckOfCards = [NSMutableArray arrayWithCapacity:52];

    for (Card *card in deckOfCards) { // Newlines before and after conditionals and loops
        NSLog(@"%@", [card description]);
    }

    Card *jokerCard = [Card joker];
    [deckOfCards addObject:jokerCard];

    // Use ! to check for nots. Comparing to 'nil' is redundant
    if (![creditCard isValid]) {
        //...
    }
}

- (void)numbersAndBools
{
    // Box variables to create NSNumber objects instead of using
    // numberWithInt/numberWithFloat/numberWithBool
    NSNumber *numberOfThings = @([objects count]);

    // Use NSInteger in favor of int/long
    NSInteger numberOfCards = [deckOfCards count];

    // Use CGFloat instead of float/double
    // Define CGFloat values with trailing decimal and f even if it's
    // a round number
    CGFloat widthOfScreen = 320.0f;
}

@end
