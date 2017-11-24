package com.svgaplayer {
	import com.svgaplayer.proto.MovieEntity;
	import com.svgaplayer.proto.MovieParams;
	import flash.utils.ByteArray;
	import flash.display.Loader;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.events.*;
	
	public class VideoEntity {

		public var version: String = ""
		
		public var videoSize: Size = new Size(0, 0);
			
		public var FPS = 20;
		
		public var frames = 0;
		
		public var images: Object = new Object();
		
		public var sprites = [];
		
		public function VideoEntity(movieItem: MovieEntity, resolve: Function) {
			var self = this;
			this.version = movieItem[MovieEntity.VERSION];
			this.videoSize.width = movieItem[MovieEntity.PARAMS][MovieParams.VIEWBOXWIDTH]
			this.videoSize.height = movieItem[MovieEntity.PARAMS][MovieParams.VIEWBOXHEIGHT]
			this.FPS = movieItem[MovieEntity.PARAMS][MovieParams.FPS]
			this.frames = movieItem[MovieEntity.PARAMS][MovieParams.FRAMES]
			resetImages(movieItem, function(): void {
				resetSprites(movieItem);	
				resolve(self);
			});
		}
		
		private function resetImages(movieItem: MovieEntity, resolve: Function): void {
			var self = this;
			var imageDatas = movieItem[MovieEntity.IMAGES];
			var count = imageDatas.length
			var done = 0;
			if (count <= 0) {
				resolve();
			}
			for (var idx: * in imageDatas) {
				(function() {
					var imageKey = imageDatas[idx].key;
					var imageData = imageDatas[idx].value;
					var loader = new Loader();
					loader.contentLoaderInfo.addEventListener(Event.INIT, function():void {
						var bitmapData = new BitmapData(loader.content.width, loader.content.height, true, 0x00000000);
						bitmapData.draw(loader)
						self.images[imageKey] = bitmapData;
						done++;
						if (done >= count) {
							resolve();
						}
					});
				loader.loadBytes(imageData)
				})()
			}
		}
		
		private function resetSprites(movieItem: MovieEntity): void {
			var self = this;
			var spriteDatas = movieItem[MovieEntity.SPRITES];
			for (var idx: * in spriteDatas) {
				self.sprites.push(new SpriteEntity(spriteDatas[idx]))
			}
		}

	}
	
}
