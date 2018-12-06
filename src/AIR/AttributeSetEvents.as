package com.myflashlab.air.extensions.spotlight
{

	/**
	 * 
	 * @author Hadi Tavakoli - 6/25/2016 2:00 PM
	 */
	public class AttributeSetEvents
	{
		/** Date this item is due. */
		public var dueDate:Number;
		
		/** Date the item was completed */
		public var completionDate:Number;
		
		/** Start date of this item. */
		public var startDate:Number;
		
		/** End date for this item. */
		public var endDate:Number;
		
		/** Whether this event covers complete days */
		public var allDay:Number;
		
		/** Important dates associated with this item */
		public var importantDates:Array;
		
		public function AttributeSetEvents():void{}
		
		/** @private */
		internal function get props():Object
		{
			return {
				"dueDate":dueDate,
				"completionDate":completionDate,
				"startDate":startDate,
				"endDate":endDate,
				"allDay":allDay,
				"importantDates":importantDates
			};
		}
	}
}