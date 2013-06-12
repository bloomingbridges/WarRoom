package map {
	
	import flash.display.Sprite;
	import flash.display.Shape;
	
	public class BlockUnit extends Shape {
		
		protected var w:Number;
		protected var h:Number;

		protected var colour:uint;
		protected var lit:Boolean;

		public function BlockUnit(highlight:Boolean, bW = 2, bH = 3) {

			w = bW;
			h = bH;
			colour = 0x111111;
			lit = highlight;

			draw();

		}

		protected function draw():void {

			if (lit)
				graphics.beginFill(0xFFFFFF);
			else 
				graphics.beginFill(colour);

			graphics.drawRect(0, 0, w, h);
			graphics.endFill();

		}

	}
	
}
