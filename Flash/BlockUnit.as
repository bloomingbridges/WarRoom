package  {
	
	import flash.display.Sprite;
	import flash.display.Shape;
	
	public class BlockUnit extends Sprite {
		
		protected var w:Number;
		protected var h:Number;

		protected var block:Shape;
		protected var colour:uint;
		protected var lit:Boolean;

		public function BlockUnit(highlight:Boolean, bW = 2, bH = 3) {

			w = bW;
			h = bH;
			colour = 0x111111;
			lit = highlight;

			block = new Shape();
			addChild(block);
			drawBlock();

		}

		protected function drawBlock():void {

			if (lit)
				block.graphics.beginFill(0xFFFFFF);
			else 
				block.graphics.beginFill(colour);

			block.graphics.drawRect(0, 0, w, h);
			block.graphics.endFill();

		}

	}
	
}
