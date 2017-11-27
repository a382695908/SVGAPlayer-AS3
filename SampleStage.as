package  {
	
	import flash.display.MovieClip;
	import com.svgaplayer.Parser;
	import com.svgaplayer.Player;
	
	
	public class SampleStage extends MovieClip {
		
		public function SampleStage() {
			var parser = new Parser()
			var player = new Player(this);
			player.setFrame(0, 0, 750, 750);
			parser.load("samples/TwitterHeart.svga", function(videoItem: *){
				player.setVideoItem(videoItem);
				player.startAnimation();
			}, function(){
			})
		}
		
	}
	
}
