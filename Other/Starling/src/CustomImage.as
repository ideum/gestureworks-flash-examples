package
{
import starling.display.Image;
import starling.textures.Texture;

	public class CustomImage extends Image
	{
		public var destX:Number = 0;
		public var destY:Number = 0;

		public function CustomImage(texture:Texture)
		{
			super(texture);
		}

	}

}