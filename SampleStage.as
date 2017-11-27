package  {
	
	import flash.display.MovieClip;
	import com.svgaplayer.Parser;
	import com.svgaplayer.Player;
	
	
	public class SampleStage extends MovieClip {
		
		public function SampleStage() {
			var parser = new Parser()
			var player = new Player(this);
			player.setFrame(300, 300, 250, 250);
			player.setClipsToBounds(true);
			parser.load("samples/rose.svga", function(videoItem: *){
				player.setVideoItem(videoItem);
				player.startAnimation();
				player.setImage("samples/avatar.png", "99");
			}, function(){
			})
		}
		
	}
	
}
