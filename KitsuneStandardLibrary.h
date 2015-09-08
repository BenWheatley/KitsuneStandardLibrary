//
//  KitsuneStandardLibrary.h
//  KitsuneStandardLibrary
//
//  Created by Ben Wheatley on 08/09/2015.
//  Copyright (c) 2015 Ben Wheatley. All rights reserved.
//

#define LocalizedString(_key_) NSLocalizedString((_key_), @"")

#define LocalizedHTMLForKey(htmlStringKey) \
	([[NSAttributedString alloc] initWithData:[LocalizedString(htmlStringKey) dataUsingEncoding:NSUTF8StringEncoding] \
									  options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, \
												NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)} \
						   documentAttributes:nil error:nil])

#define ObjectToString(object) ([NSString stringWithFormat:@"%@", object])

#define SafeValueOrNil(x) ((x)?(x):@"")

#define RGB(r,g,b) ([UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1])
