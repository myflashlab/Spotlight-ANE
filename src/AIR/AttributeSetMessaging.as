package com.myflashlab.air.extensions.spotlight
{

	/**
	 * 
	 * @author Hadi Tavakoli - 6/25/2016 2:00 PM
	 */
	public class AttributeSetMessaging
	{
		/** Unique identifier for the account the item is associated with, if any */
		public var accountIdentifier:String;
		
		/** Contains the text content of the document. */
		public var textContent:String;
		
		/** Array of the canonical handles of the account the item is associated with (IM handle, e-mail address, phone number...). E.g. in Mail's case, all the email addresses the account receives email on. */
		public var accountHandles:Array;
		
		/** Array of Mailbox identifiers associated with the item. e.g. CSMailboxInbox, CSMailboxDrafts, CSMailboxSent, or a custom identifier etc. */
		public var mailboxIdentifiers:Array;
		
		/** The list of author/authors that have worked on this item. There could be 0 or more authors of a particular item. The order of the authors in the array is preserved, but is not intended to represent the main author or relative importance of the authors. */
		public var authorNames:Array;
		
		/** This attribute indicates the recipients of this item. */
		public var recipientNames:Array;
		
		/** This attribute indicates the author of the emails message addresses. (This is always the email address, and not the human readable version) */
		public var authorEmailAddresses:Array;
		
		/** This attribute indicates the reciepients email addresses. (This is always the email address,  and not the human readable version). */
		public var recipientEmailAddresses:Array;
		
		/** This attribute indicates the author addresses of the document. */
		public var authorAddresses:Array;
		
		/** This attribute indicates the recipient addresses of the document. */
		public var recipientAddresses:Array;
		
		/** Phone numbers for this item. */
		public var phoneNumbers:Array;
		
		/** Email addresses for this item. */
		public var emailAddresses:Array;
		
		/** Instant message addresses for this item. */
		public var instantMessageAddresses:Array;
		
		/** This attribute indicates if the document is likely to be considered junk.  Should be 1 if true, 0 otherwise */
		public var likelyJunk:Number;
		
		public function AttributeSetMessaging():void{}
		
		/** @private */
		internal function get props():Object
		{
			return {
				"accountIdentifier":accountIdentifier,
				"textContent":textContent,
				"accountHandles":accountHandles,
				"mailboxIdentifiers":mailboxIdentifiers,
				"authorNames":authorNames,
				"recipientNames":recipientNames,
				"authorEmailAddresses":authorEmailAddresses,
				"recipientEmailAddresses":recipientEmailAddresses,
				"authorAddresses":authorAddresses,
				"recipientAddresses":recipientAddresses,
				"phoneNumbers":phoneNumbers,
				"emailAddresses":emailAddresses,
				"instantMessageAddresses":instantMessageAddresses,
				"likelyJunk":likelyJunk
			};
		}
	}
}