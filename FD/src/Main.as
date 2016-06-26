package 
{
	import com.doitflash.consts.Direction;
	import com.doitflash.consts.Orientation;
	import com.doitflash.mobileProject.commonCpuSrc.DeviceInfo;
	import com.doitflash.starling.utils.list.List;
	import com.doitflash.text.modules.MySprite;
	
	import com.luaye.console.C;
	
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemIdleMode;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.InvokeEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.ui.Keyboard;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	import com.myflashlab.air.extensions.spotlight.Spotlight;
	import com.myflashlab.air.extensions.spotlight.SpotlightEvents;
	import com.myflashlab.air.extensions.spotlight.AttributeSet;
	import com.myflashlab.air.extensions.spotlight.ContentType;
	
	/**
	 * ...
	 * @author Hadi Tavakoli - 6/26/2016 10:12 AM
	 */
	public class Main extends Sprite 
	{
		private const BTN_WIDTH:Number = 150;
		private const BTN_HEIGHT:Number = 60;
		private const BTN_SPACE:Number = 2;
		private var _txt:TextField;
		private var _body:Sprite;
		private var _list:List;
		private var _numRows:int = 1;
		
		public function Main():void 
		{
			Multitouch.inputMode = MultitouchInputMode.GESTURE;
			NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, handleActivate);
			NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE, handleDeactivate);
			NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE, onInvoke);
			NativeApplication.nativeApplication.addEventListener(KeyboardEvent.KEY_DOWN, handleKeys);
			
			stage.addEventListener(Event.RESIZE, onResize);
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			C.startOnStage(this, "`");
			C.commandLine = false;
			C.commandLineAllowed = false;
			C.x = 20;
			C.width = 250;
			C.height = 150;
			C.strongRef = true;
			C.visible = true;
			C.scaleX = C.scaleY = DeviceInfo.dpiScaleMultiplier;
			
			_txt = new TextField();
			_txt.autoSize = TextFieldAutoSize.LEFT;
			_txt.antiAliasType = AntiAliasType.ADVANCED;
			_txt.multiline = true;
			_txt.wordWrap = true;
			_txt.embedFonts = false;
			_txt.htmlText = "<font face='Arimo' color='#333333' size='20'><b>Spotlight ANE for Adobe Air V"+Spotlight.VERSION+"</font>";
			_txt.scaleX = _txt.scaleY = DeviceInfo.dpiScaleMultiplier;
			this.addChild(_txt);
			
			_body = new Sprite();
			this.addChild(_body);
			
			_list = new List();
			_list.holder = _body;
			_list.itemsHolder = new Sprite();
			_list.orientation = Orientation.VERTICAL;
			_list.hDirection = Direction.LEFT_TO_RIGHT;
			_list.vDirection = Direction.TOP_TO_BOTTOM;
			_list.space = BTN_SPACE;
			
			init();
			onResize();
		}
		
		private function onInvoke(e:InvokeEvent):void
		{
			
		}
		
		private function handleActivate(e:Event):void
		{
			NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
		}
		
		private function handleDeactivate(e:Event):void
		{
			NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.NORMAL;
		}
		
		private function handleKeys(e:KeyboardEvent):void
		{
			if(e.keyCode == Keyboard.BACK)
            {
				e.preventDefault();
				NativeApplication.nativeApplication.exit();
            }
		}
		
		private function onResize(e:*=null):void
		{
			if (_txt)
			{
				_txt.width = stage.stageWidth * (1 / DeviceInfo.dpiScaleMultiplier);
				
				C.x = 0;
				C.y = _txt.y + _txt.height + 0;
				C.width = stage.stageWidth * (1 / DeviceInfo.dpiScaleMultiplier);
				C.height = 300 * (1 / DeviceInfo.dpiScaleMultiplier);
			}
			
			if (_list)
			{
				_numRows = Math.floor(stage.stageWidth / (BTN_WIDTH * DeviceInfo.dpiScaleMultiplier + BTN_SPACE));
				_list.row = _numRows;
				_list.itemArrange();
			}
			
			if (_body)
			{
				_body.y = stage.stageHeight - _body.height;
			}
		}
		
		
		private var _ex:Spotlight;
		private function init():void
		{
			_ex = new Spotlight();
			_ex.addEventListener(SpotlightEvents.INDEXING_SUCCESS, onIndexingSuccess);
			_ex.addEventListener(SpotlightEvents.INDEXING_FAILURE, onIndexingFailure);
			_ex.addEventListener(SpotlightEvents.DELETING_SUCCESS, onDeletingSuccess);
			_ex.addEventListener(SpotlightEvents.DELETING_FAILURE, onDeletingFailure);
			_ex.addEventListener(SpotlightEvents.SEARCH_SELECTED, onSearchSelected);
			
			C.log("isIndexingAvailable = " + _ex.isIndexingAvailable);
			
			//----------------------------------------------------------------------
			
			var btn1:MySprite = createBtn("index");
			btn1.addEventListener(MouseEvent.CLICK, index);
			_list.add(btn1);
			
			function index(e:MouseEvent):void
			{
				var att:AttributeSet = new AttributeSet(ContentType.kUTTypeItem, "com.site.uniquIdentifier.1", "domain.identifier.1");
				att.general.title = "MyFlashLabs.com";
				att.documents.contentDescription = "Find the best collection of Adobe Air Native Extensions here. Our mission is to get your mind free of any Adobe Air limitations by developing cool ANEs.";
				att.general.keywords = ["Adobe Air", "ANE", "MyFLashLabs"];
				att.general.thumbnailURL = File.applicationDirectory.resolvePath("spotlightIcon.jpg").nativePath;
				
				var att2:AttributeSet = new AttributeSet(ContentType.kUTTypeItem, "com.site.uniquIdentifier.2", "domain.identifier.1");
				att2.general.title = "MyFlashLabs spotlight ANE";
				att2.documents.contentDescription = "This spotlight ANE will let you create search items in runtime and with user generated data! This is so cool, isn't it?";
				att2.general.keywords = ["Adobe Air", "ANE", "MyFLashLabs"];
				att2.general.thumbnailURL = File.applicationDirectory.resolvePath("spotlightIcon.jpg").nativePath;
				
				_ex.indexItems([att, att2]);
			}
			
			//----------------------------------------------------------------------
			
			var btn2:MySprite = createBtn("delete indexes");
			btn2.addEventListener(MouseEvent.CLICK, toDelete);
			_list.add(btn2);
			
			function toDelete(e:MouseEvent):void
			{
				_ex.deleteItems();
			}
			
			//----------------------------------------------------------------------
			
			
		}
		
		private function onIndexingSuccess(e:SpotlightEvents):void
		{
			C.log("on indexing completed successfully");
		}
		
		private function onIndexingFailure(e:SpotlightEvents):void
		{
			C.log("on indexing failed! try again: " + e.msg);
		}
		
		private function onDeletingSuccess(e:SpotlightEvents):void
		{
			C.log("on deleting success");
		}
		
		private function onDeletingFailure(e:SpotlightEvents):void
		{
			C.log("on deleting failed: " + e.msg);
		}
		
		private function onSearchSelected(e:SpotlightEvents):void
		{
			C.log("on search result touched: " + e.msg);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		private function createBtn($str:String):MySprite
		{
			var sp:MySprite = new MySprite();
			sp.addEventListener(MouseEvent.MOUSE_OVER,  onOver);
			sp.addEventListener(MouseEvent.MOUSE_OUT,  onOut);
			sp.addEventListener(MouseEvent.CLICK,  onOut);
			sp.bgAlpha = 1;
			sp.bgColor = 0xDFE4FF;
			sp.drawBg();
			sp.width = BTN_WIDTH * DeviceInfo.dpiScaleMultiplier;
			sp.height = BTN_HEIGHT * DeviceInfo.dpiScaleMultiplier;
			
			function onOver(e:MouseEvent):void
			{
				sp.bgAlpha = 1;
				sp.bgColor = 0xFFDB48;
				sp.drawBg();
			}
			
			function onOut(e:MouseEvent):void
			{
				sp.bgAlpha = 1;
				sp.bgColor = 0xDFE4FF;
				sp.drawBg();
			}
			
			var format:TextFormat = new TextFormat("Arimo", 16, 0x666666, null, null, null, null, null, TextFormatAlign.CENTER);
			
			var txt:TextField = new TextField();
			txt.autoSize = TextFieldAutoSize.LEFT;
			txt.antiAliasType = AntiAliasType.ADVANCED;
			txt.mouseEnabled = false;
			txt.multiline = true;
			txt.wordWrap = true;
			txt.scaleX = txt.scaleY = DeviceInfo.dpiScaleMultiplier;
			txt.width = sp.width * (1 / DeviceInfo.dpiScaleMultiplier);
			txt.defaultTextFormat = format;
			txt.text = $str;
			
			txt.y = sp.height - txt.height >> 1;
			sp.addChild(txt);
			
			return sp;
		}
	}
	
}