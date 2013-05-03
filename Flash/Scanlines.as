package {
	
	import flash.display.MovieClip;
	import flash.display.Shape;	

	public class Scanlines extends MovieClip { 
	
		public function Scanlines(sW, sH) {

			var lines:Shape;
			lines = new Shape;
			lines.graphics.beginFill(0x000000,0.4);

			for (var i = 0; i < sH / 2 ; i++) {

				lines.graphics.drawRect(0, i*2, sW, 1);

			}

			lines.graphics.endFill();
			addChild(lines);
	
		}

	}

}