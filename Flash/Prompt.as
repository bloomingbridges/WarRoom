package {
	
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.text.*;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	import map.BlockUnit;
	
	public class Prompt extends Sprite {

		public  var label0:TextField;
		public  var label1:TextField;
		public  var label2:TextField;
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

			// x = WarRoom.HALF_WIDTH - ( ( pW * (properties.width + properties.spacing) - properties.spacing ) / 2 );
			x = WarRoom.FULL_WIDTH / 2 - (( pW * (WarRoom.bW + WarRoom.bS) ) / 2);
			y = WarRoom.FULL_HEIGHT / 2 - (( pH * (WarRoom.bH + WarRoom.bS) ) / 2);
			// y = 100 + ( 32 * (properties.height + properties.spacing) );

			format = new TextFormat();
			format.color = 0xFFFFFF;
			format.size = 36;
			format.font = "Mini Pixel-7"; 
			format.align = TextFormatAlign.CENTER;

			label0 = new TextField();
			label0.text = "Actions have concequences.";
			label0.x = 12;
			label0.y = 8;
			label0.width = pW * ( properties.width * properties.spacing ) - 24;
			label0.setTextFormat(format);
			addChild(label0);

			format.size = 24;

			label1 = new TextField();
			label1.text = "Find out, enter your email. One email, No Spam.";

			label1.x = 12;
			label1.y = 45;
			label1.width = pW * ( properties.width * properties.spacing ) - 24;
			label1.setTextFormat(format);
			addChild(label1);

			format.size = 18;

			label2 = new TextField();
			label2.text = "Press ENTER to continue";

			label2.x = 12;
			label2.y = 114;
			label2.width = pW * ( properties.width * properties.spacing ) - 24;
			label2.setTextFormat(format);
			addChild(label2);

			format.size = 24;

			input = new TextField();
			input.text = "";
			input.maxChars = 48;
			input.restrict = "A-Z a-z 0-9 \. \- \_ \@";
			input.autoSize = TextFieldAutoSize.CENTER;
			//input.embedFonts = true;
			input.x = 12;
			input.y = 78;
			input.width = pW * ( properties.width * properties.spacing ) - 24;
			input.defaultTextFormat = format;
			input.setTextFormat(format);
			input.type = TextFieldType.INPUT;
			addChild(input);

		}

		public function doBackspace(e:KeyboardEvent) {
			if (input.text.length > 0 && e.keyCode === Keyboard.BACKSPACE) {
				var str:String = input.text;
   				input.text = str.slice(0,str.length);
			}
		}

	}
	
}
