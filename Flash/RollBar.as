package {
	
	import flash.display.MovieClip;
	import flash.display.Shape;	
	import flash.filters.BlurFilter;
	import flash.filters.BitmapFilter;
	import flash.filters.BitmapFilterQuality;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;

	public class RollBar extends MovieClip { 
	
		public function RollBar(sW, sH) {

			var bar:Shape;
			bar = new Shape;
			bar.graphics.beginFill(0x000000,0.2);
			bar.graphics.drawRect(0, 0, sW, 100 );
			bar.graphics.endFill();

			var filter:BitmapFilter = new BlurFilter(0, 10, BitmapFilterQuality.HIGH);
			var filters:Array = new Array();
			filters.push(filter);

			bar.filters = filters;

			addChild(bar);

			var barTween = new Tween(bar, "y", None.easeNone, 0, sH, 2, true);
			// var barTween = new Tween(bar, "y", None.easeNone, -200, sH*2, 2, true);

			barTween.addEventListener(TweenEvent.MOTION_FINISH, restart);
	
		}

		function restart(e:TweenEvent):void {

			e.currentTarget.start();

		}

	}

}