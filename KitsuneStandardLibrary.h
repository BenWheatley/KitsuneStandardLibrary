//
//  KitsuneStandardLibrary.h
//  KitsuneStandardLibrary
//
//  Created by Ben Wheatley on 08/09/2015.
//  Copyright (c) 2015 Ben Wheatley. All rights reserved.
//

/* Grep to find all reasonably localisable strings, with the aim of zero false negatives and minimal false positives:
 (?<!LocalizedHTMLForKey\()(?<!setDateFormat:)(?<!NSClassFromString\()(?<!reuseIdentifier:)(?<!dequeueReusableCellWithIdentifier:)(?<!requestForGraphPath:)(?<!NSLog\()(?<!componentsJoinedByString:)(?<!imageNamed:)(?<!initWithNibName:)(?<!LocalizedString\()(?<!predicateWithFormat:)(?<!DLog\()@".+"
 */

#define LocalizedString(_key_) NSLocalizedString((_key_), @"")

#define LocalizedHTMLForKey(htmlStringKey) \
	([[NSAttributedString alloc] initWithData:[LocalizedString(htmlStringKey) dataUsingEncoding:NSUTF8StringEncoding] \
									  options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, \
												NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)} \
						   documentAttributes:nil error:nil])

#define ObjectToString(object) ([NSString stringWithFormat:@"%@", object])
#define IntToString(x) ([NSString stringWithFormat:@"%d", x])
#define FloatToString(x) ([NSString stringWithFormat:@"%f", x])

#define ArrayToCommaSeparatedString(array) ([array componentsJoinedByString:@","])

#define SafeRebuildAsNSString(pointer) \
	if (![pointer isKindOfClass:NSString.class]) { \
		pointer = ObjectToString(userID); \
	}

#define SafeValueOrNil(x) ((x)?(x):@"")

/** This currently handles if-let-not-nil and if-let-is-type, but not where clauses
	Note: these days I prefer functions to macros, but I don't see any way to pass
	a local variable _name_ to a function such that it would create a code block
	which can use that _name_ internally when being compiled.
 
 TODO: does _not_ handle commas in code block: this can be worked around with ()'s, e.g.
	 `foo = @[1, 2];`
		 becomes
	 `foo = (@[1, 2]);`
 */
#define IF_LET(tempType, temp, optional, code) \
if ((optional)!=nil && [optional isKindOfClass:tempType.class]) { \
	tempType *temp = (tempType*)optional;\
	{code}\
}

#define RGB(r,g,b) ([UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1])
