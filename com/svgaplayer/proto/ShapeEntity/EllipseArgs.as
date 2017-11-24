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
	public dynamic final class EllipseArgs extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const X:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.ShapeEntity.EllipseArgs.x", "x", (1 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

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
		public static const Y:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.ShapeEntity.EllipseArgs.y", "y", (2 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

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
		public static const RADIUSX:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.ShapeEntity.EllipseArgs.radiusX", "radiusX", (3 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var radiusX$field:Number;

		public function clearRadiusX():void {
			hasField$0 &= 0xfffffffb;
			radiusX$field = new Number();
		}

		public function get hasRadiusX():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set radiusX(value:Number):void {
			hasField$0 |= 0x4;
			radiusX$field = value;
		}

		public function get radiusX():Number {
			return radiusX$field;
		}

		/**
		 *  @private
		 */
		public static const RADIUSY:FieldDescriptor_TYPE_FLOAT = new FieldDescriptor_TYPE_FLOAT("com.svgaplayer.proto.ShapeEntity.EllipseArgs.radiusY", "radiusY", (4 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var radiusY$field:Number;

		public function clearRadiusY():void {
			hasField$0 &= 0xfffffff7;
			radiusY$field = new Number();
		}

		public function get hasRadiusY():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set radiusY(value:Number):void {
			hasField$0 |= 0x8;
			radiusY$field = value;
		}

		public function get radiusY():Number {
			return radiusY$field;
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
			if (hasRadiusX) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, radiusX$field);
			}
			if (hasRadiusY) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, radiusY$field);
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
			var radiusX$count:uint = 0;
			var radiusY$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (x$count != 0) {
						throw new flash.errors.IOError('Bad data format: EllipseArgs.x cannot be set twice.');
					}
					++x$count;
					this.x = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 2:
					if (y$count != 0) {
						throw new flash.errors.IOError('Bad data format: EllipseArgs.y cannot be set twice.');
					}
					++y$count;
					this.y = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 3:
					if (radiusX$count != 0) {
						throw new flash.errors.IOError('Bad data format: EllipseArgs.radiusX cannot be set twice.');
					}
					++radiusX$count;
					this.radiusX = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				case 4:
					if (radiusY$count != 0) {
						throw new flash.errors.IOError('Bad data format: EllipseArgs.radiusY cannot be set twice.');
					}
					++radiusY$count;
					this.radiusY = com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
