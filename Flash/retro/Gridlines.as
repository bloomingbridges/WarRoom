package retro {
	
	import flash.display.MovieClip;
	import flash.display.Shape;	

	public class Gridlines extends MovieClip { 
	
		public function Gridlines() {
			var i;

			var sW = WarRoom.FULL_WIDTH;
			var sH = WarRoom.FULL_HEIGHT;
			var bW = WarRoom.bW;
			var bH = WarRoom.bH;
			var bS = WarRoom.bS;

			var lines:Shape;
			lines = new Shape;
			lines.graphics.beginFill(0x000000);

			for (i = 0; i < sH / (bH + bS) ; i++) {

				lines.graphics.drawRect(0, i * (bH + bS) + bH, sW, bS);

			}

			lines.graphics.endFill();
			addChild(lines);

			var lines2:Shape;
			lines2 = new Shape;
			lines2.graphics.beginFill(0x000000);

			for (i = 0; i < sW / (bW + bS) ; i++) {

				lines2.graphics.drawRect( i * (bW + bS) + bW, 0, bS, sH);

			}

			lines2.graphics.endFill();
			addChild(lines2);

			this.cacheAsBitmap = true;
	
		}

	}

}