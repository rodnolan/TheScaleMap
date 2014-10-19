package vo {

	public class MusicalScale {
		
		public static var chromaticScaleSharps:Array = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"];
		public static var chromaticScaleFlats:Array = ["C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"];
		public var useSharps:Boolean;
		
		public var key:String;
		public var intervalBits:Bitfield;
		public var scaleName:String;
		
		public var display_01_1:Boolean;
		public var display_02_b2:Boolean
		public var display_03_2:Boolean
		public var display_04_b3:Boolean;
		public var display_05_3:Boolean;
		public var display_06_4:Boolean;
		public var display_07_b5:Boolean;
		public var display_08_5:Boolean;
		public var display_09_b6:Boolean;
		public var display_10_6:Boolean;
		public var display_11_b7:Boolean;
		public var display_12_7:Boolean;

		public var noteName_01_1:String;
		public var noteName_02_b2:String
		public var noteName_03_2:String
		public var noteName_04_b3:String;
		public var noteName_05_3:String;
		public var noteName_06_4:String;
		public var noteName_07_b5:String;
		public var noteName_08_5:String;
		public var noteName_09_b6:String;
		public var noteName_10_6:String;
		public var noteName_11_b7:String;
		public var noteName_12_7:String;
		
		
		public function MusicalScale(scaleName:String, intervals:Array, key:String, useSharps:Boolean = true) {
			this.scaleName = scaleName;
			intervalBits = new Bitfield();
			for (var i:int=0; i<intervals.length; i++) {
				intervalBits.SetBit(i, intervals[i]);
			}
			this.display_01_1 = intervals[0] == 1;
			this.display_02_b2 = intervals[1] == 1;
			this.display_03_2 = intervals[2] == 1;
			this.display_04_b3 = intervals[3] == 1;
			this.display_05_3 = intervals[4] == 1;
			this.display_06_4 = intervals[5] == 1;
			this.display_07_b5 = intervals[6] == 1;
			this.display_08_5 = intervals[7] == 1;
			this.display_09_b6 = intervals[8] == 1;
			this.display_10_6 = intervals[9] == 1;
			this.display_11_b7 = intervals[10] == 1;
			this.display_12_7 = intervals[11] == 1;
			this.key = key;
			this.useSharps = useSharps;

			setNotesForKey(this.key);
		}
		
		public function setNotesForKey(key:String = MusicalKeyConstants.KEY_C):void {
			
			var offset:int;
			var reorderedNotes:Array;
			if (this.useSharps) {
				offset = chromaticScaleSharps.indexOf(key);
				reorderedNotes = reindexArray(chromaticScaleSharps, offset);
			} else {
				offset = chromaticScaleFlats.indexOf(key);
				reorderedNotes = reindexArray(chromaticScaleFlats, offset);
			}
			
			trace(reorderedNotes);
			
			this.noteName_01_1 = this.display_01_1 ? reorderedNotes[0] : "";
			this.noteName_02_b2 = this.display_02_b2 ? reorderedNotes[1] : ""; 
			this.noteName_03_2 = this.display_03_2  ? reorderedNotes[2] : "";;
			this.noteName_04_b3 = this.display_04_b3 ? reorderedNotes[3] : "";
			this.noteName_05_3 = this.display_05_3 ? reorderedNotes[4] : "";
			this.noteName_06_4 = this.display_06_4 ? reorderedNotes[5] : "";
			this.noteName_07_b5 = this.display_07_b5 ? reorderedNotes[6] : "";
			this.noteName_08_5 = this.display_08_5 ? reorderedNotes[7] : "";
			this.noteName_09_b6 = this.display_09_b6 ? reorderedNotes[8] : "";
			this.noteName_10_6 = this.display_10_6 ? reorderedNotes[9] : "";
			this.noteName_11_b7 = this.display_11_b7 ? reorderedNotes[10] : "";
			this.noteName_12_7 = this.display_12_7 ? reorderedNotes[11] : "";
		}
		
		private function reindexArray(arrayToReorg:Array, startingAt:uint):Array {
			var firstPart:Array = arrayToReorg.slice(startingAt);
			var secondPart:Array = arrayToReorg.slice(0, startingAt);
			return firstPart.concat(secondPart);
		}
	}
}