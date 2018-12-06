package com.myflashlab.air.extensions.spotlight
{

	/**
	 * 
	 * @author Hadi Tavakoli - 6/23/2016 1:27 PM
	 */
	public class ContentType
	{
		/** generic base type for most things */
		public static const kUTTypeItem:String = "kUTTypeItem";
		
		/** base type for anything containing user-viewable document content (documents, pasteboard data, and document packages) */
		public static const kUTTypeContent:String = "kUTTypeContent";
		
		/** base type for messages (email, IM, etc.) */
		public static const kUTTypeMessage:String = "kUTTypeMessage";
		
		/** contact information, e.g. for a person, group, organization */
		public static const kUTTypeContact:String = "kUTTypeContact";
		
		/** The bytes of a URL */
		public static const kUTTypeURL:String = "kUTTypeURL";
		
		/** base type for all text-encoded data, including text with markup (HTML, RTF, etc.) */
		public static const kUTTypeText:String = "kUTTypeText";
		
		/** abstract type for source code (any language) */
		public static const kUTTypeSourceCode:String = "kUTTypeSourceCode";
		
		/** abstract image data */
		public static const kUTTypeImage:String = "kUTTypeImage";
		
		/** audio and/or video content */
		public static const kUTTypeAudiovisualContent:String = "kUTTypeAudiovisualContent";
		
		/** base type for OS X applications, launchable items */
		public static const kUTTypeApplication:String = "kUTTypeApplication";
		
		
		public function ContentType():void
		{
			
		}
	}
}