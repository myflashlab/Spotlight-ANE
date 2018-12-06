package com.myflashlab.air.extensions.spotlight
{

	/**
	 * 
	 * @author Hadi Tavakoli - 6/25/2016 2:00 PM
	 */
	public class AttributeSetMusic
	{
		/** The musical key of the song/composition contained in an audio file. For example: C, Dm, F#m, Bb. */
		public var keySignature:String;
		
		/** The time signature of the musical composition contained in the audio/MIDI file. For example: "4/4", "7/8". */
		public var timeSignature:String;
		
		/** The name of the application that encoded the data contained in the audio file. */
		public var audioEncodingApplication:String;
		
		/** The composer of the song/composition contained in the audio file. */
		public var composer:String;
		
		/** The lyricist/text writer for song/composition contained in the audio file. */
		public var lyricist:String;
		
		/** The title for a collection of media. This is analagous to a record album, or photo album whichs are collections of audio or images. */
		public var album:String;
		
		/** The artist for the media */
		public var artist:String;
		
		/** The musical genre of the song/composition contained in the audio file. For example: Jazz, Pop, Rock, Classical. */
		public var musicalGenre:String;
		
		/** Meta data attribute that stores the category of instrument. Files should have an instrument associated with them ("Other Instrument" is provided as a catch-all). For some categories, like "Keyboards" there are instrument names which provide a more detailed instrument definition (e.g., Piano,Organ, etc.) */
		public var musicalInstrumentCategory:String;
		
		/** Meta data attribute that stores the name of instrument (relative to the instrument category) Files can have aninstrument name associated with them if they have certain instrument categories (e.g., the category Percussion has multiple instruments, including Conga and Bongo). */
		public var musicalInstrumentName:String;
		
		/** The recording date of the song/composition. This information differs from the contentCreationDate attribute as it indicates the date that the 'art' was created, in contrast to contentCreationDate which for example, could indicate the creation date of an edited or 'mastered' version of the original art. */
		public var recordingDate:Number;
		
		/** The sample rate of the audio data contained in the file. The sample rate is a float value representing hz (audio_frames/second). For example: 44100.0, 22254.54. */
		public var audioSampleRate:Number;
		
		/** The number of channels in the audio data contained in the file. This item only represents the number of discreet channels of audio data found in the file. It does not indicate any configuration of the data in regards to a user's speaker setup. */
		public var audioChannelCount:Number;
		
		/** The tempo of the music contained in the audio file in Beats Per Minute. */
		public var tempo:Number;
		
		/** The track number of a song/composition when it is part of an album */
		public var audioTrackNumber:Number;
		
		/** This attribute indicates whether the MIDI sequence contained in the file is setup for use with a General MIDI device.  Should be 1 if true, 0 otherwise. */
		public var generalMIDISequence:Number;
		
		public function AttributeSetMusic():void{}
		
		/** @private */
		internal function get props():Object
		{
			return {
				"keySignature":keySignature,
				"timeSignature":timeSignature,
				"audioEncodingApplication":audioEncodingApplication,
				"composer":composer,
				"lyricist":lyricist,
				"album":album,
				"artist":artist,
				"musicalGenre":musicalGenre,
				"musicalInstrumentCategory":musicalInstrumentCategory,
				"musicalInstrumentName":musicalInstrumentName,
				"recordingDate":recordingDate,
				"audioSampleRate":audioSampleRate,
				"audioChannelCount":audioChannelCount,
				"tempo":tempo,
				"audioTrackNumber":audioTrackNumber,
				"generalMIDISequence":generalMIDISequence
			};
		}
	}
}