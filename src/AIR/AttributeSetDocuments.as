package com.myflashlab.air.extensions.spotlight
{

	/**
	 * 
	 * @author Hadi Tavakoli - 6/25/2016 1:05 PM
	 */
	public class AttributeSetDocuments extends Object
	{
		/** Subject of the this item. */
		public var subject:String;
		
		/** Theme of the this item. */
		public var theme:String;
		
		/** An account of the content of the resource. Description may include but is not limited to: an abstract, table of contents, reference to a graphical representation of content or a free-text account of the content. */
		public var contentDescription:String;
		
		/** Used  to reference to the resource within a given context. Recommended best practice is to identify the resource by means of a string or number conforming to a formal identification system. */
		public var identifier:String;
		
		/** Security (encryption) method used in the file  */
		public var securityMethod:String;
		
		/** Application used to create the document content (e.g. "Word", "Framemaker", etc.). */
		public var creator:String;
		
		/** Kind that this item represents. */
		public var kind:String;
		
		/** A class of entity for whom the resource is intended or useful. A class of entity may be determined by the creator or the publisher or by a third party. */
		public var audiences:Array;
		
		/** Array of font names used in the item. */
		public var fontNames:Array;
		
		/** Size of the document in MB. */
		public var fileSize:Number;
		
		/** Number of pages in the item. */
		public var pageCount:Number;
		
		/** Width in points (72 points per inch) of the document page (first page only for PDF's - other pages within the PDF may not be the same width). */
		public var pageWidth:Number;
		
		/** Height in points (72 points per inch) of the document page (first page only for PDF's - other pages within the PDF may not be the same height). */
		public var pageHeight:Number;
		
		public function AttributeSetDocuments():void{}
		
		/** @private */
		internal function get props():Object
		{
			return {
				"subject":subject,
				"theme":theme,
				"contentDescription":contentDescription,
				"identifier":identifier,
				"securityMethod":securityMethod,
				"creator":creator,
				"kind":kind,
				"audiences":audiences,
				"fontNames":fontNames,
				"fileSize":fileSize,
				"pageCount":pageCount,
				"pageWidth":pageWidth,
				"pageHeight":pageHeight
			};
		}
	}
}