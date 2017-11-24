package com.svgaplayer {
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.events.*; 
	import flash.net.URLLoaderDataFormat;
	import flash.utils.ByteArray;
	import com.svgaplayer.proto.MovieEntity;
	
	public class Parser {

		public function Parser() { }
		
		public function load(url: String, resolve: Function, reject: Function) {
			var self = this;
			self.fetch(url, function(byteArray): void {
				self.parse(byteArray, function(videoItem){ resolve(videoItem); }, function(error){ reject(error); });
			}, function reject(error): void {
				reject(error);
			});
		}
		
		private function fetch(url: String, resolve: Function, reject: Function) {
			var request = new URLRequest(url);
			var loader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.BINARY;
			loader.addEventListener(Event.COMPLETE, function(): void {
				var byteArray = new ByteArray();
				byteArray.writeBytes(loader.data);
				try {
					byteArray.uncompress("zlib")
					resolve(byteArray);
				} catch (error: Error) {
					reject(error);
				}
			})
			try {
				loader.load(request);
			}
			catch (error: Error) { 
				reject(error);
			}
		}
		
		private function parse(data: ByteArray, resolve: Function, reject: Function) {
			var movieItem = new MovieEntity();
			data.position = 0;
			movieItem.mergeFrom(data);
			new VideoEntity(movieItem, function(videoItem){
				resolve(videoItem);
			});
		}

	}
	
}
