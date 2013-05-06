package {
	
	import flash.display.MovieClip;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class Noise extends MovieClip { 

		// var noise;

		var noises = new Array;
		var current = 0;
	
		public function Noise(sW, sH) {

			for (var i = 0; i < 4 ; i++) {

				var noiseBitmap:BitmapData = new BitmapData(sW, sH ,false, 0xff000000);
				noiseBitmap.noise(Math.random() * 1000, 0, 255, 7, true); 
				noises[i] = new Bitmap(noiseBitmap); 
				// addChild(noises[i]);

				noises[i].blendMode = 'overlay';
				noises[i].alpha = 0.3;

			}

			// noiseFrame.addChild(noise); 

			var noiseTime:Timer = new Timer(50);
			noiseTime.addEventListener(TimerEvent.TIMER, update);
			noiseTime.start();

			// noise = noises[0];
			addChild(noises[0]);
	
		}

		function update(e:TimerEvent) {

			removeChild(noises[current]);

			current = (current === 3) ? 0 : current + 1 ;

			addChild(noises[current]);

		}

	}

}