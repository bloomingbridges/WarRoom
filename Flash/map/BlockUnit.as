package map {
	
	import flash.display.Sprite;
	import flash.display.Shape;
	
	public class BlockUnit extends Shape {
		
		protected var w:Number;
		protected var h:Number;

		protected var colour:uint;
		protected var alphaz:int;
		protected var lit:Boolean;

		public function BlockUnit(highlight:Boolean) {

			w = WarRoom.bW;
			h = WarRoom.bH;
			colour = 0x111111;
			alpha = 0.8;
			lit = highlight;

			draw();

		}

		protected function draw():void {

			if (lit) {

				graphics.beginFill(0xFFFFFF);
				alpha = 1;
			
			} else {

				graphics.beginFill(colour);
			
			} 

			graphics.drawRect(0, 0, w, h);
			graphics.endFill();

		}

	}
	
}
