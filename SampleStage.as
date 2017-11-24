package  {
	
	import flash.display.MovieClip;
	import com.svgaplayer.Parser;
	
	
	public class SampleStage extends MovieClip {
		
		
		public function SampleStage() {
			var parser = new Parser()
			parser.load("samples/angel.svga")
		}
		
	}
	
}
