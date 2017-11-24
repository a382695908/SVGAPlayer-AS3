package com.svgaplayer.proto.ShapeEntity {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ShapeArgs extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const D:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.svgaplayer.proto.ShapeEntity.ShapeArgs.d", "d", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var d$field:String;

		public function clearD():void {
			d$field = null;
		}

		public function get hasD():Boolean {
			return d$field != null;
		}

		public function set d(value:String):void {
			d$field = value;
		}

		public function get d():String {
			return d$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasD) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, d$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var d$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (d$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShapeArgs.d cannot be set twice.');
					}
					++d$count;
					this.d = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
