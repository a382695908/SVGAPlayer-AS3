package com.svgaplayer {
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.events.*; 
	import flash.net.URLLoaderDataFormat;
	import flash.utils.ByteArray;
	import com.svgaplayer.proto.MovieEntity;
	
	public class Parser {

		public function Parser() { }
		
		public function load(url: String) {
			var self = this;
			self.fetch(url, function resolve(byteArray): void {
				self.parse(byteArray, function resolve(){}, function reject(){});
			}, function reject(error): void {
				trace(error.message)
			});
		}
		
		private function fetch(url: String, resolve: Function, reject: Function) {
			var request = new URLRequest(url);
			var loader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.BINARY;
			loader.addEventListener(Event.COMPLETE, function handler(): void {
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
			trace(movieItem[MovieEntity.VERSION])
		}

	}
	
}
