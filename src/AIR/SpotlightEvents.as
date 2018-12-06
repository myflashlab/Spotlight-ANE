package com.myflashlab.air.extensions.spotlight
{
	import flash.events.Event;
	
	/**
	 * 
	 * @author Hadi Tavakoli - 6/25/2016 5:58 PM
	 */
	public class SpotlightEvents extends Event
	{
		public static const INDEXING_SUCCESS:String = "onSpotlightIndexingSuccess";
		public static const INDEXING_FAILURE:String = "onSpotlightIndexingFailure";
		public static const DELETING_SUCCESS:String = "onSpotlightDeletingSuccess";
		public static const DELETING_FAILURE:String = "onSpotlightDeletingFailure";
		
		public static const SEARCH_SELECTED:String = "onSpotlightSearchSelected";
		
		private var _msg:String;
		
		/**
		 * @private
		 * 
		 * @param	$type
		 * @param	$msg
		 */
		public function SpotlightEvents($type:String, $msg:String=null):void
		{
			_msg = $msg;
			
			super($type, false, false);
		}
		
		public function get msg():String
		{
			return _msg;
		}
	}
	
}