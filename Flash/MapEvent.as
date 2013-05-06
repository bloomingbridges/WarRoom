package {

	import flash.events.Event;
	import flash.geom.Point;

	public class MapEvent extends Event {

		public static const ON_READY:String = "onReady";
		public static const ON_CHANGE:String = "onChange";
		public static const ON_SHUFFLE:String = "onShuffle";

		public var newDestination:Point;

		public function MapEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false):void {
			super(type, bubbles, cancelable);
	  	}

	}

}