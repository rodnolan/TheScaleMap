package vo {
	public class ChordType {
		
		public var name:String;
		public var noteIntervals:Array;
		public var intervalBits:Bitfield;

		public function ChordType(name:String, noteIntervals:Array) {
			this.name = name;
			this.noteIntervals = noteIntervals;
			intervalBits = new Bitfield();
			for (var i:int=0; i<noteIntervals.length; i++) {
				intervalBits.SetBit(i, noteIntervals[i]);
			}
		}
	}
}