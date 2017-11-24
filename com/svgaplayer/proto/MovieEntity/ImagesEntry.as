package com.svgaplayer.proto.MovieEntity {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ImagesEntry extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const KEY:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.svgaplayer.proto.MovieEntity.ImagesEntry.key", "key", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var key$field:String;

		public function clearKey():void {
			key$field = null;
		}

		public function get hasKey():Boolean {
			return key$field != null;
		}

		public function set key(value:String):void {
			key$field = value;
		}

		public function get key():String {
			return key$field;
		}

		/**
		 *  @private
		 */
		public static const VALUE:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("com.svgaplayer.proto.MovieEntity.ImagesEntry.value", "value", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var value$field:flash.utils.ByteArray;

		public function clearValue():void {
			value$field = null;
		}

		public function get hasValue():Boolean {
			return value$field != null;
		}

		public function set value(value:flash.utils.ByteArray):void {
			value$field = value;
		}

		public function get value():flash.utils.ByteArray {
			return value$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasKey) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, key$field);
			}
			if (hasValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BYTES(output, value$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var key$count:uint = 0;
			var value$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (key$count != 0) {
						throw new flash.errors.IOError('Bad data format: ImagesEntry.key cannot be set twice.');
					}
					++key$count;
					this.key = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (value$count != 0) {
						throw new flash.errors.IOError('Bad data format: ImagesEntry.value cannot be set twice.');
					}
					++value$count;
					this.value = com.netease.protobuf.ReadUtils.read_TYPE_BYTES(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
