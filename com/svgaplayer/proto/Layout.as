package com.svgaplayer.proto {
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
	public dynamic final class Layout extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const X:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.Layout.x", "x", (1 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var x$field:Number;

		private var hasField$0:uint = 0;

		public function clearX():void {
			hasField$0 &= 0xfffffffe;
			x$field = new Number();
		}

		public function get hasX():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set x(value:Number):void {
			hasField$0 |= 0x1;
			x$field = value;
		}

		public function get x():Number {
			return x$field;
		}

		/**
		 *  @private
		 */
		public static const Y:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.Layout.y", "y", (2 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var y$field:Number;

		public function clearY():void {
			hasField$0 &= 0xfffffffd;
			y$field = new Number();
		}

		public function get hasY():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set y(value:Number):void {
			hasField$0 |= 0x2;
			y$field = value;
		}

		public function get y():Number {
			return y$field;
		}

		/**
		 *  @private
		 */
		public static const WIDTH:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.Layout.width", "width", (3 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var width$field:Number;

		public function clearWidth():void {
			hasField$0 &= 0xfffffffb;
			width$field = new Number();
		}

		public function get hasWidth():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set width(value:Number):void {
			hasField$0 |= 0x4;
			width$field = value;
		}

		public function get width():Number {
			return width$field;
		}

		/**
		 *  @private
		 */
		public static const HEIGHT:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.Layout.height", "height", (4 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var height$field:Number;

		public function clearHeight():void {
			hasField$0 &= 0xfffffff7;
			height$field = new Number();
		}

		public function get hasHeight():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set height(value:Number):void {
			hasField$0 |= 0x8;
			height$field = value;
		}

		public function get height():Number {
			return height$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasX) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, x$field);
			}
			if (hasY) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, y$field);
			}
			if (hasWidth) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, width$field);
			}
			if (hasHeight) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, height$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var x$count:uint = 0;
			var y$count:uint = 0;
			var width$count:uint = 0;
			var height$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (x$count != 0) {
						throw new flash.errors.IOError('Bad data format: Layout.x cannot be set twice.');
					}
					++x$count;
					this.x = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 2:
					if (y$count != 0) {
						throw new flash.errors.IOError('Bad data format: Layout.y cannot be set twice.');
					}
					++y$count;
					this.y = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 3:
					if (width$count != 0) {
						throw new flash.errors.IOError('Bad data format: Layout.width cannot be set twice.');
					}
					++width$count;
					this.width = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 4:
					if (height$count != 0) {
						throw new flash.errors.IOError('Bad data format: Layout.height cannot be set twice.');
					}
					++height$count;
					this.height = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
