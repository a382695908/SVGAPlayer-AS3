package com.svgaplayer {
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.*
	import flash.display.Graphics;
	import com.svgaplayer.FrameEntity
	import com.svgaplayer.SpriteEntity

	import flash.geom.Matrix;
	import flash.sampler.Sample;
	import flash.display.Sprite;

	public class Player {

		public var loops = 0;
		public var clearsAfterStop = true;
		
		public function Player(displayObject: MovieClip) {
			this.displayObject = displayObject;
		}
		
		public function setVideoItem(videoItem: VideoEntity) {
			this.currentFrame = 0;
			this.videoItem = videoItem;
			this.clear();
			this.draw();
			this.update();
		}
		
		public function clear() {
			
		}
		
		public function startAnimation() {
			this.stopAnimation(false);
			this.setupTicker();
		}
		
		public function stopAnimation(clear: Boolean) {
			if (clear) {
				this.clear();
			}
		}
		
		private var displayObject: MovieClip
		private var currentFrame = 0;
		private var currentTick = 0;
		private var videoItem: VideoEntity = null;
		private var loopCount = 0;
		private var rootLayer: Sprite = null;
		private var nextTickTime = 0;
		
		private function setupTicker() {
			this.displayObject.addEventListener(Event.ENTER_FRAME, this.onTick);
		}
		
		private function onTick(sender: *) {
			if (this.videoItem == null) { return; }
			var now = new Date().time;
			if (now < this.nextTickTime) {
				return;
			}
			this.nextTickTime = (1000 / this.videoItem.FPS) + now - (60 / this.videoItem.FPS) * 2
			this.currentFrame++;
			if (this.currentFrame >= this.videoItem.frames) {
				this.currentFrame = 0;
				this.loopCount++;
				if (this.loops > 0 && this.loopCount >= this.loops) {
					this.stopAnimation(this.clearsAfterStop);
					return;
				}
			}
			this.update()
		}
		
		private function draw() {
			if (this.rootLayer !== null) {
				this.displayObject.removeChild(this.rootLayer);
			}
			this.rootLayer = new Sprite()
			for (var idx:* in this.videoItem.sprites) {
				var spriteItem: com.svgaplayer.SpriteEntity = this.videoItem.sprites[idx];
				var bitmapData = this.videoItem.images[spriteItem.imageKey];
				if (bitmapData != null && bitmapData != undefined) {
					var container: Sprite = new Sprite();
					container.graphics.beginBitmapFill(bitmapData, null, false, true);
					container.graphics.drawRect(0, 0, bitmapData.width, bitmapData.height);
					container.graphics.endFill();
					this.rootLayer.addChild(container);
				}
			}
			this.rootLayer.width = this.videoItem.videoSize.width;
			this.rootLayer.height = this.videoItem.videoSize.height;
			this.rootLayer.transform.matrix = new Matrix(1.0, 0.0, 0.0, 1.0, 0.0, 0.0)
			this.displayObject.addChild(this.rootLayer);
		}
		
		private function update() {
			for (var idx:* in this.videoItem.sprites) {
				var spriteItem: com.svgaplayer.SpriteEntity = this.videoItem.sprites[idx];
				var childSprite: DisplayObject = this.rootLayer.getChildAt(idx)
				if (this.currentFrame < spriteItem.frames.length) {
					var frameItem: com.svgaplayer.FrameEntity = spriteItem.frames[this.currentFrame];
					childSprite.alpha = frameItem.alpha;
					childSprite.transform.matrix = new Matrix(frameItem.transform.a, frameItem.transform.b, frameItem.transform.c, frameItem.transform.d, frameItem.transform.tx, frameItem.transform.ty);
					if (frameItem.maskPath !== null && frameItem.maskSprite === null) {
						frameItem.createMaskSprite();
					}
					if (frameItem.maskSprite != null) {
						childSprite.mask = frameItem.maskSprite;
						frameItem.maskSprite.transform.matrix = new Matrix(frameItem.transform.a, frameItem.transform.b, frameItem.transform.c, frameItem.transform.d, frameItem.transform.tx, frameItem.transform.ty);
					}
					else {
						childSprite.mask = null;
					}
				}
			}
		}

	}
	
}
