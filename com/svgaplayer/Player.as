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
	import flash.display.Shape;

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
		
		public function setFrame(x: Number, y: Number, width: Number, height: Number) {
			this.frame = new Rect(x, y, width, height);
			this.update();
		}
		
		public function setContentMode(mode: String) {
			this.contentMode = mode;
			this.update();
		}
		
		public function clear() {
			if (this.rootLayer) {
				this.displayObject.removeChild(this.rootLayer);
			}
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
		private var contentMode = "AspectFit"
		private var frame: Rect = new Rect(0, 0, 0, 0);
		
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
				var container: Sprite = new Sprite();
				var bitmapLayer: Sprite = new Sprite();
				var bitmapData = this.videoItem.images[spriteItem.imageKey];
				if (bitmapData != null && bitmapData != undefined) {
					bitmapLayer.graphics.beginBitmapFill(bitmapData, null, false, true);
					bitmapLayer.graphics.drawRect(0, 0, bitmapData.width, bitmapData.height);
					bitmapLayer.graphics.endFill();
				}
				container.addChild(bitmapLayer);
				container.addChild(new Sprite());
				this.rootLayer.addChild(container);
			}
			this.rootLayer.width = this.videoItem.videoSize.width;
			this.rootLayer.height = this.videoItem.videoSize.height;
			var clipMask: Shape = new Shape();
			clipMask.graphics.beginFill(0xffffff);
			clipMask.graphics.drawRect(0, 0, this.videoItem.videoSize.width, this.videoItem.videoSize.height);
			clipMask.graphics.endFill();
			this.rootLayer.mask = clipMask;
			this.rootLayer.addChild(clipMask);
			this.rootLayer.transform.matrix = new Matrix(1.0, 0.0, 0.0, 1.0, 0.0, 0.0)
			this.displayObject.addChild(this.rootLayer);
		}
		
		private function resize() {
			var scaleX = 1.0; var scaleY = 1.0; var translateX = 0.0; var translateY = 0.0;
			var targetSize = this.frame;
			var imageSize = this.videoItem.videoSize;
			if (this.contentMode === "Fill") {
				scaleX = targetSize.width / imageSize.width;
				scaleY = targetSize.height / imageSize.height;
			}
			else if (this.contentMode === "AspectFit" || this.contentMode === "AspectFill") {
				var imageRatio = imageSize.width / imageSize.height;
				var viewRatio = targetSize.width / targetSize.height;
				if ((imageRatio >= viewRatio && this.contentMode === "AspectFit") || (imageRatio <= viewRatio && this.contentMode === "AspectFill")) {
					scaleX = scaleY = targetSize.width / imageSize.width;
					translateY = (targetSize.height - imageSize.height * scaleY) / 2.0
				}
				else if ((imageRatio < viewRatio && this.contentMode === "AspectFit") || (imageRatio > viewRatio && this.contentMode === "AspectFill")) {
					scaleX = scaleY = targetSize.height / imageSize.height;
					translateX = (targetSize.width - imageSize.width * scaleX) / 2.0
				}
			}
			this.rootLayer.transform.matrix = new Matrix(scaleX, 0, 0, scaleY, this.frame.x + translateX, this.frame.y + translateY);
		}
		
		private function update() {
			if (this.videoItem == null){ return; }
			this.resize();
			for (var idx:* in this.videoItem.sprites) {
				var spriteItem: com.svgaplayer.SpriteEntity = this.videoItem.sprites[idx];
				var childSprite: * = this.rootLayer.getChildAt(idx)
				if (this.currentFrame < spriteItem.frames.length) {
					var frameItem: com.svgaplayer.FrameEntity = spriteItem.frames[this.currentFrame];
					childSprite.alpha = frameItem.alpha;
					if (frameItem.shapes.length > 0) {
						var vectorLayer: * = childSprite.getChildAt(1);
						while (vectorLayer.numChildren > 0) {
							vectorLayer.removeChild(vectorLayer.getChildAt(0));
						}
						for (var vdx: * in frameItem.shapes) {
							var shapeLayer = new Shape();
							frameItem.shapes[vdx].makeStyle(shapeLayer.graphics);
							frameItem.shapes[vdx].drawPath(shapeLayer.graphics);
							shapeLayer.graphics.endFill();
							if (frameItem.shapes[vdx].transform) {
								var t = frameItem.shapes[vdx].transform;
								shapeLayer.transform.matrix = new Matrix(t.a, t.b, t.c, t.d, t.tx, t.ty);
							}
							vectorLayer.addChild(shapeLayer);
						}
					}
					childSprite.transform.matrix = new Matrix(frameItem.transform.a, frameItem.transform.b, frameItem.transform.c, frameItem.transform.d, frameItem.transform.tx, frameItem.transform.ty);
					if (frameItem.maskPath !== null && frameItem.maskSprite === null) {
						frameItem.createMaskSprite();
					}
					if (frameItem.maskSprite != null) {
						this.rootLayer.addChild(frameItem.maskSprite);
						childSprite.mask = frameItem.maskSprite;
						frameItem.maskSprite.transform.matrix = new Matrix(frameItem.transform.a, frameItem.transform.b, frameItem.transform.c, frameItem.transform.d, frameItem.transform.tx, frameItem.transform.ty);
						this.rootLayer.removeChild(frameItem.maskSprite);
					}
					else {
						childSprite.mask = null;
					}
				}
			}
		}

	}
	
}
