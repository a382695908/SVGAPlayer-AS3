package  {
	
	import flash.display.MovieClip;
	import com.svgaplayer.Parser;
	import com.svgaplayer.Player;
	import flash.utils.*;
	
	public class SampleStage extends MovieClip {
		
		public function SampleStage() {
			var parser = new Parser()
			var player = new Player(this);
			player.setFrame(0, 0, 750, 750);
			player.setClipsToBounds(true);
			parser.load("samples/kingset.svga", function(videoItem: *){
				player.setVideoItem(videoItem);
				player.startAnimation();
				player.setImage("samples/avatar.png", "99");
				player.setText({
					text: "Hello, World!",
					size: "34px",
					color: "#ffff00"
				}, "banner");
			}, function(){
			})
		}
		
	}
	
}
