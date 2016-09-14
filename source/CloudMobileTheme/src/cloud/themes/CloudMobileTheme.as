package cloud.themes
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class CloudMobileTheme extends BaseCloudMobileTheme
	{		
		[Embed(source="../../assets/images/cloud_mobile.xml",mimeType="application/octet-stream")]
		protected static const ATLAS_XML:Class;
		
		[Embed(source="../../assets/images/cloud_mobile.png")]
		protected static const ATLAS_BITMAP:Class;
		
		public function CloudMobileTheme()
		{
			super();
			initialize();
		}
		
		override protected function initialize():void
		{
			initializeTextureAtlas();
			super.initialize();
		}
		
		protected function initializeTextureAtlas():void
		{
			var atlasBitmapData:BitmapData = Bitmap(new ATLAS_BITMAP()).bitmapData;
			var atlasTexture:Texture = Texture.fromBitmapData(atlasBitmapData, false, false, 2);
			atlasTexture.root.onRestore = atlasTexture_onRestore;
			atlasBitmapData.dispose();
			atlas = new TextureAtlas(atlasTexture, XML(new ATLAS_XML()));
		}
		
		protected function atlasTexture_onRestore():void
		{
			var atlasBitmapData:BitmapData = Bitmap(new ATLAS_BITMAP()).bitmapData;
			atlas.texture.root.uploadBitmapData(atlasBitmapData);
			atlasBitmapData.dispose();
		}
	}
}