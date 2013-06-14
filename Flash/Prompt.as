package {
	
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.text.*;
	import flash.events.KeyboardEvent;

	import map.BlockUnit;
	
	public class Prompt extends Sprite {

		public  var label:TextField;
		public  var input:TextField;
		private var format:TextFormat;

		public function Prompt(pW:int, pH:int, properties:Object) {

			var block:BlockUnit;
			var contour:Boolean;

			for (var i=0; i<pH; i++) {
				for (var j=0; j<pW; j++) {
					contour = (j == 0 || j == pW - 1 || i == 0 || i == pH - 1) ? true: false;
					block = new BlockUnit(contour);
					block.x = j * ( properties.width + properties.spacing );
					block.y = i * ( properties.height + properties.spacing );
					addChild(block);
				}
			}

			x = WarRoom.HALF_WIDTH - ( ( pW * (properties.width + properties.spacing) - properties.spacing ) / 2 );
			y = 100 + ( 32 * (properties.height + properties.spacing) );

			format = new TextFormat();
			format.color = 0xFFFFFF;
			format.size = 24;
			format.font = "Mini Pixel-7"; 
			format.align = TextFormatAlign.CENTER;

			label = new TextField();
			label.text = "Please verify your email address";
			
			label.x = 12;
			label.y = 12;
			label.width = pW * ( properties.width * properties.spacing ) - 24;
			label.setTextFormat(format);
			addChild(label);

			input = new TextField();
			input.text = "";
			input.embedFonts = true;
			input.x = 12;
			input.y = 48;
			input.width = pW * ( properties.width * properties.spacing ) - 24;
			input.defaultTextFormat = format;
			input.type = TextFieldType.INPUT
			addChild(input);

		}

	}
	
}
