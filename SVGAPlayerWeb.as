package  {
	
	import flash.display.MovieClip;
	import com.svgaplayer.Parser;
	import com.svgaplayer.Player;
	import flash.external.ExternalInterface;
	import com.svgaplayer.VideoEntity;
	
	public class SVGAPlayerWeb extends MovieClip {
		
		public function SVGAPlayerWeb() {
			this.sharedPlayer = new Player(this);
			this.setupInterfaces();
		}
		
		private function setupInterfaces() {
			ExternalInterface.addCallback("SVGAParser_Instance_load", this.SVGAParser_Instance_load);
			ExternalInterface.addCallback("SVGAPlayer_Instance_setLoops", this.SVGAPlayer_Instance_setLoops);
			ExternalInterface.addCallback("SVGAPlayer_Instance_setClearsAfterStop", this.SVGAPlayer_Instance_setClearsAfterStop);
			ExternalInterface.addCallback("SVGAPlayer_Instance_setContentMode", this.SVGAPlayer_Instance_setContentMode);
			ExternalInterface.addCallback("SVGAPlayer_Instance_setClipsToBounds", this.SVGAPlayer_Instance_setClipsToBounds);
			ExternalInterface.addCallback("SVGAPlayer_Instance_pauseAnimation", this.SVGAPlayer_Instance_pauseAnimation);
			ExternalInterface.addCallback("SVGAPlayer_Instance_stopAnimation", this.SVGAPlayer_Instance_stopAnimation);
			ExternalInterface.addCallback("SVGAPlayer_Instance_clear", this.SVGAPlayer_Instance_clear);
			ExternalInterface.addCallback("SVGAPlayer_Instance_stepToFrame", this.SVGAPlayer_Instance_stepToFrame);
			ExternalInterface.addCallback("SVGAPlayer_Instance_stepToPercentage", this.SVGAPlayer_Instance_stepToPercentage);
			ExternalInterface.addCallback("SVGAPlayer_Instance_setImage", this.SVGAPlayer_Instance_setImage);
			ExternalInterface.addCallback("SVGAPlayer_Instance_setText", this.SVGAPlayer_Instance_setText);
			ExternalInterface.addCallback("SVGAPlayer_Instance_clearDynamicObjects", this.SVGAPlayer_Instance_clearDynamicObjects);
			ExternalInterface.addCallback("SVGAPlayer_Instance_onFinished", this.SVGAPlayer_Instance_onFinished);
			ExternalInterface.addCallback("SVGAPlayer_Instance_onFrame", this.SVGAPlayer_Instance_onFrame);
			ExternalInterface.addCallback("SVGAPlayer_Instance_onPercentage", this.SVGAPlayer_Instance_onPercentage);
			ExternalInterface.addCallback("SVGAPlayer_Instance_setVideoItem", this.SVGAPlayer_Instance_setVideoItem);
			ExternalInterface.addCallback("SVGAPlayer_Instance_setFrame", this.SVGAPlayer_Instance_setFrame);
			ExternalInterface.addCallback("SVGAPlayer_Instance_startAnimation", this.SVGAPlayer_Instance_startAnimation);
			ExternalInterface.call("SVGACB_" + this.root.loaderInfo.parameters.uuid + "_onReady");
		}
		
		private var sharedParser: Parser = new Parser();
		private var videoItems: Object = new Object();
		
		private function SVGAParser_Instance_load(url: String, successHandler: String, failureHandler: String) {
			var self = this;
			sharedParser.load(url, function(videoItem: VideoEntity) {
				self.videoItems[url] = videoItem;
				if (successHandler) {
					ExternalInterface.call(successHandler, url);
				}
			}, function(error: Error) {
				if (failureHandler) {
					ExternalInterface.call(failureHandler, error.message);
				}
			});
		}
		
		private var sharedPlayer: Player;
		
		private function SVGAPlayer_Instance_setLoops(value: Number) {
			this.sharedPlayer.loops = value;
		}
		
		private function SVGAPlayer_Instance_setClearsAfterStop(value: Boolean) {
			this.sharedPlayer.clearsAfterStop = value;
		}
		
		private function SVGAPlayer_Instance_setContentMode(value: String) {
			this.sharedPlayer.setContentMode(value);
		}
		
		private function SVGAPlayer_Instance_setClipsToBounds(value: Boolean) {
			this.sharedPlayer.setClipsToBounds(value);
		}
		
		private function SVGAPlayer_Instance_pauseAnimation() {
			this.sharedPlayer.pauseAnimation();
		}
		
		private function SVGAPlayer_Instance_stopAnimation(clear: Boolean) {
			this.sharedPlayer.stopAnimation(clear);
		}
		private function SVGAPlayer_Instance_clear() {
			this.sharedPlayer.clear();
		}
		
		private function SVGAPlayer_Instance_stepToFrame(frame: Number, andPlay: Boolean) {
			this.sharedPlayer.stepToFrame(frame, andPlay);
		}
		
		private function SVGAPlayer_Instance_stepToPercentage(percentage: Number, andPlay: Boolean) {
			this.sharedPlayer.stepToPercentage(percentage, andPlay);
		}
		
		private function SVGAPlayer_Instance_setImage(urlORBase64: String, forKey: String) {
			this.sharedPlayer.setImage(urlORBase64, forKey);
		}
		
		private function SVGAPlayer_Instance_setText(textORMap: *, forKey: String) {
			this.sharedPlayer.setText(textORMap, forKey);
		}
		
		private function SVGAPlayer_Instance_clearDynamicObjects() {
			this.sharedPlayer.clearDynamicObjects();
		}
		
		private function SVGAPlayer_Instance_onFinished(handler: String) {
			this.sharedPlayer.onFinished(function() {
				ExternalInterface.call(handler);
			});
		}
		
		private function SVGAPlayer_Instance_onFrame(handler: String) {
			this.sharedPlayer.onFrame(function(value) {
				ExternalInterface.call(handler, value);
			});
		}
		
		private function SVGAPlayer_Instance_onPercentage(handler: String) {
			this.sharedPlayer.onPercentage(function(value) {
				ExternalInterface.call(handler, value);
			});
		}
		
		private function SVGAPlayer_Instance_setVideoItem(videoItemRef: String) {
			if (this.videoItems[videoItemRef]) {
				this.sharedPlayer.setVideoItem(this.videoItems[videoItemRef]);
			}
		}
		
		private function SVGAPlayer_Instance_setFrame(x: Number, y: Number, width: Number, height: Number) {
			this.sharedPlayer.setFrame(x, y, width, height);
		}
		
		private function SVGAPlayer_Instance_startAnimation() {
			this.sharedPlayer.startAnimation();
		}
		
	}
	
}
