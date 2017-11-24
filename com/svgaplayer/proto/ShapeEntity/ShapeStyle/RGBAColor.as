package com.svgaplayer.proto.ShapeEntity.ShapeStyle {
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
	public dynamic final class RGBAColor extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const R:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.ShapeEntity.ShapeStyle.RGBAColor.r", "r", (1 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var r$field:Number;

		private var hasField$0:uint = 0;

		public function clearR():void {
			hasField$0 &= 0xfffffffe;
			r$field = new Number();
		}

		public function get hasR():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set r(value:Number):void {
			hasField$0 |= 0x1;
			r$field = value;
		}

		public function get r():Number {
			return r$field;
		}

		/**
		 *  @private
		 */
		public static const G:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.ShapeEntity.ShapeStyle.RGBAColor.g", "g", (2 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var g$field:Number;

		public function clearG():void {
			hasField$0 &= 0xfffffffd;
			g$field = new Number();
		}

		public function get hasG():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set g(value:Number):void {
			hasField$0 |= 0x2;
			g$field = value;
		}

		public function get g():Number {
			return g$field;
		}

		/**
		 *  @private
		 */
		public static const B:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.ShapeEntity.ShapeStyle.RGBAColor.b", "b", (3 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var b$field:Number;

		public function clearB():void {
			hasField$0 &= 0xfffffffb;
			b$field = new Number();
		}

		public function get hasB():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set b(value:Number):void {
			hasField$0 |= 0x4;
			b$field = value;
		}

		public function get b():Number {
			return b$field;
		}

		/**
		 *  @private
		 */
		public static const A:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.ShapeEntity.ShapeStyle.RGBAColor.a", "a", (4 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var a$field:Number;

		public function clearA():void {
			hasField$0 &= 0xfffffff7;
			a$field = new Number();
		}

		public function get hasA():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set a(value:Number):void {
			hasField$0 |= 0x8;
			a$field = value;
		}

		public function get a():Number {
			return a$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasR) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, r$field);
			}
			if (hasG) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, g$field);
			}
			if (hasB) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, b$field);
			}
			if (hasA) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, a$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var r$count:uint = 0;
			var g$count:uint = 0;
			var b$count:uint = 0;
			var a$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (r$count != 0) {
						throw new flash.errors.IOError('Bad data format: RGBAColor.r cannot be set twice.');
					}
					++r$count;
					this.r = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 2:
					if (g$count != 0) {
						throw new flash.errors.IOError('Bad data format: RGBAColor.g cannot be set twice.');
					}
					++g$count;
					this.g = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 3:
					if (b$count != 0) {
						throw new flash.errors.IOError('Bad data format: RGBAColor.b cannot be set twice.');
					}
					++b$count;
					this.b = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 4:
					if (a$count != 0) {
						throw new flash.errors.IOError('Bad data format: RGBAColor.a cannot be set twice.');
					}
					++a$count;
					this.a = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
